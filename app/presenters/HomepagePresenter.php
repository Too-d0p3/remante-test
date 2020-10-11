<?php

namespace App\Presenters;

use App\Forms\ProductFormFactory;
use App\Model\Facades\producerFacade;
use App\Model\Facades\product_typeFacade;
use App\Model\Facades\productFacade;
use App\Model;
use Ublaboo\DataGrid\DataGrid;


class HomepagePresenter extends BasePresenter
{
    private $Product_typeFacade;
    private $ProductFacade;
    private $ProducerFacade;


    public function __construct(product_typeFacade $Product_typeFacade, productFacade $ProductFacade, producerFacade $ProducerFacade)
    {
        parent::__construct();
        $this->Product_typeFacade = $Product_typeFacade;
        $this->ProductFacade = $ProductFacade;
        $this->ProducerFacade = $ProducerFacade;
    }

    public function renderDefault()
    {
    }


    public function createComponentSimpleGrid()
    {
        $grid = new DataGrid;
        $data = $this->ProductFacade->getQBForAllProducts();
        $grid->setDataSource($data);

        $grid->setItemsPerPageList([10]);

        $grid->addColumnText('code', 'Kód')
            ->setSortable()
            ->setFilterText();
        $grid->addColumnText('product_type', 'Typ produktu', 'product_type.type')
            ->setSortable('pt.type')
            ->setFilterText('pt.type');
        $grid->addColumnText('producer', 'Výrobce', 'producer.name')
            ->setSortable('p.name')
            ->setFilterText('p.name');
        $grid->addColumnNumber('price', 'Cena')
            ->setRenderer(function ($item) {
                return number_format($item->price, 0, ",", " ") . ' Kč';
            })
            ->setSortable('price')
            ->setFilterText();


        $grid->addAction('Product:show', 'Show');
        $grid->addAction('Product:edit', 'Edit');
        $grid->addExportCsvFiltered('Csv export', 'data.csv')
            ->setTitle('Csv export');
        return $grid;

    }

}
