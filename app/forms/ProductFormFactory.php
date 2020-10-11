<?php

namespace App\Forms;


use App\Model\Facades\producerFacade;
use App\Model\Facades\product_typeFacade;
use App\Model\Facades\productFacade;
use Nette\Application\UI\Form;
use Nette\Object;
use Tomaj\Form\Renderer\BootstrapRenderer;

/**
 * Továrnička pro tvorbu registračního formuláře.
 * @package App\Forms
 */
class ProductFormFactory extends Object
{

    private $ProductFacade;
    private $Product_typeFacade;
    private $ProducerFacade;


    public function __construct(productFacade $ProductFacade, product_typeFacade $Product_typeFacade, producerFacade $ProducerFacade)
    {
        $this->ProductFacade = $ProductFacade;
        $this->Product_typeFacade = $Product_typeFacade;
        $this->ProducerFacade = $ProducerFacade;
    }

    public function createEdit()
    {
        $form = new Form;
        $form->setRenderer(new BootstrapRenderer);

        $form->addHidden("productId");

        $form->addText("code", "Kód")
            ->setRequired("*");

        $form->addSelect("product_type", "Typ produktu");

        $form->addSelect("producer", "Výrobce");

        $form->addInteger("price", "Cena")
            ->setRequired("*");

        $form->addTextArea("description", "Popis")
            ->setRequired("*");

        $form->addSubmit("edit", "Edit");

        $form->onSuccess[] = array($this, "editSubmitted");

        return $form;
    }

    public function editSubmitted($form, $values)
    {
        try {
            $product = $this->ProductFacade->getProductById($values->productId);
            $product_type = $this->Product_typeFacade->getProductTypeById($values->product_type);
            $producer = $this->ProducerFacade->getProducerById($values->producer);

            $values->product_type = $product_type;
            $values->producer = $producer;

            if (is_null($product)) throw new InvalidArgumentException("productDoesntExist");
            $this->ProductFacade->editProduct($product, $values);
        } catch (UniqueConstraintViolationException $e) {
            $form->addError("");
        }
    }


}
