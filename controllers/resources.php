<?php

namespace project\controllers;

use project\kernel\system\Controller;
use project\models\Subjects;
use project\models\Resources as ResourcesModel;

class Resources extends Controller
{
    public function actionIndex()
    {
        $model_resources = new ResourcesModel();
        if(!(isset($_GET['page']) && preg_match("/^[\d]+$/", $_GET['page']))) {
            $_GET['page'] = 1;
        }
        $resources = $model_resources->getList($_GET['page']);


        $model_subjects = new Subjects();
        $subjects = $model_subjects->getList();

        $this->addScript('index');
        $this->view(
            'resources',
            [
                'title' => 'Интернет-ресурсы',
                'content' => $resources['data'],
                'pages' => $resources['pages'],
                'page_active' => $_GET['page'],
                'subjects' => $subjects,
            ]
        );
    }
    public function actionAdd()
    {
        if (!isset($_POST['add-url'])) {
            return false;
        }
        if (!isset($_POST['add-contact'])) {
            return false;
        }
        if (!isset($_POST['add-subject'])) {
            return false;
        }

        $model_resources = new ResourcesModel;
        $id = $model_resources->add($_POST['add-subject'], $_POST['add-url'], $_POST['add-contact']);

        if (!preg_match('/[0-9]+/', $id)) {
            return false;
        }
        echo 'true';
        return;


    }
    public function actionEdit()
    {
        if (!isset($_POST['edit-url'])) {
            return false;
        }
        if (!isset($_POST['edit-contact'])) {
            return false;
        }
        if (!isset($_POST['edit-subject'])) {
            return false;
        }

        $model_resources = new ResourcesModel;
        $model_resources->edit($_POST['id'], $_POST['edit-subject'], $_POST['edit-url'], $_POST['edit-contact']);

        echo 'true';
        return;
    }
    public function actionId()
    {
        $model_resources = new ResourcesModel;
        echo json_encode( $model_resources->getResourceById($_POST['edit-id']));
    }
    public function actionDelete()
    {
        if (!isset($_POST['resource_id'])) {
            return false;
        }
        $model_resources = new ResourcesModel;
        $model_resources->delete($_POST['resource_id']);
    }
}
