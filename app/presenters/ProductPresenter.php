<?php


namespace App\Presenters;


use App\Forms\ProductFormFactory;
use App\Model\Facades\producerFacade;
use App\Model\Facades\product_typeFacade;
use App\Model\Facades\productFacade;
use Nette\Application\UI\Form;

class ProductPresenter extends BasePresenter
{
    private $Product_typeFacade;
    private $ProductFacade;
    private $ProducerFacade;

    /**
     * @var ProductFormFactory
     * @inject
     */
    public $formFactory;

    public function __construct(product_typeFacade $Product_typeFacade, productFacade $ProductFacade, producerFacade $ProducerFacade)
    {
        parent::__construct();
        $this->Product_typeFacade = $Product_typeFacade;
        $this->ProductFacade = $ProductFacade;
        $this->ProducerFacade = $ProducerFacade;
    }

    public function actionShow($id)
    {
        $product = $this->ProductFacade->getProductById($id);
        if (is_null($product)) $this->redirect("Homepage:default");
        $product->price = number_format($product->price, 0, ",", " ") . " Kč";
        $this->template->product = $product;
    }

    public function actionEdit($id)
    {
        $product = $this->ProductFacade->getProductById($id);
        if (is_null($product)) $this->redirect("Homepage:default");

        $product_types = $this->Product_typeFacade->getAllProductTypes();
        if (is_null($product)) throw new InvalidArgumentException("productTypesDoesntExist");

        $producers = $this->ProducerFacade->getAllProducers();
        if (is_null($product)) throw new InvalidArgumentException("producersDoesntExist");

        $product_typesSelectBoxValues = [];
        foreach ($product_types as $type) {
            $product_typesSelectBoxValues += [$type->id => $type->type];
        }

        $producersSelectBoxValues = [];
        foreach ($producers as $producer) {
            $producersSelectBoxValues += [$producer->id => $producer->name];
        }

        if (isset($product)) {
            $this["editForm"]["product_type"]->setItems($product_typesSelectBoxValues);
            $this["editForm"]["producer"]->setItems($producersSelectBoxValues);
            $this["editForm"]->setDefaults(array(
                "productId" => $product->id,
                "code" => $product->code,
                "product_type" => $product->product_type->id,
                "producer" => $product->producer->id,
                "price" => $product->price,
                "description" => $product->description
            ));

        }
    }

    protected function createComponentEditForm()
    {
        $form = $this->formFactory->createEdit();
        $form->onSuccess[] = function (Form $form) {
            $p = $form->getPresenter();

            $p->flashMessage("Produkt editován");
            $p->redirect("show", $form["productId"]->getValue());
        };
        return $form;
    }
}