<?php

namespace project\controllers;

use project\kernel\system\Controller;
use project\models\Resources;
use project\models\AdUnit as AdUnitModel;

class AdUnit extends Controller
{
    public function actionIndex()
    {
        $model_adunit = new AdUnitModel();
        if (!(isset($_GET['page']) && preg_match("/^[\d]+$/", $_GET['page']))) {
            $_GET['page'] = 1;
        }
        $adunits = $model_adunit->getList($_GET['page']);

        $resources = new Resources();
        $resources = $resources->getListAll();


        $this->addScript('adunit');
        $this->view(
            'adunit',
            [
                'title' => 'Рекламные блоки',
                'content' => $adunits['data'],
                'page_active' => $_GET['page'],
                'pages' => $adunits['pages'],
                'resources' => $resources
            ]
        );
    }
    public function actionAdd()
    {
        if (!isset($_POST['add-name'])) {
            return false;
        }
        if (!isset($_POST['add-description'])) {
            return false;
        }
        if (!isset($_POST['add-resource'])) {
            return false;
        }

        $model_adunit = new AdUnitModel;
        $id = $model_adunit->add($_POST['add-name'], $_POST['add-description'], $_POST['add-resource']);

        if (!preg_match('/[0-9]+/', $id)) {
            return false;
        }
        echo 'true';
        return;
    }
    public function actionEdit()
    {
        if (!isset($_POST['edit-name'])) {
            return false;
        }
        if (!isset($_POST['edit-description'])) {
            return false;
        }
        if (!isset($_POST['edit-resource'])) {
            return false;
        }

        $model_adunit = new AdUnitModel;
        $model_adunit->edit($_POST['id'], $_POST['edit-name'], $_POST['edit-description'], $_POST['edit-resource']);

        echo 'true';
        return;
    }
    public function actionId()
    {
        $model_adunit = new AdUnitModel;
        echo json_encode($model_adunit->getAdUnitById($_POST['adunit_id']));
    }
    public function actionDelete()
    {
        if (!isset($_POST['adunit_id'])) {
            return false;
        }
        $model_adunit = new AdUnitModel;
        $model_adunit->delete($_POST['adunit_id']);
    }
}
