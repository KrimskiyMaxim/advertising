<?php

namespace project\controllers;

use project\kernel\system\Controller;
use project\models\Statistic as StatisticModel;

class Statistic extends Controller
{
    public function actionView()
    {
        if (!(isset($_GET['id']) && preg_match("/^[\d]+$/", $_GET['id']))) {
            echo 'Error';
            return;
        }

        $statistic_model = new StatisticModel();
        $content = $statistic_model->getViewsByAdUnit($_GET['id']);

        $quantity = $statistic_model->quantityView($_GET['id']);

        $this->view(
            'statistic',
            [
                'content' => $content,
                'quantity' => $quantity,
                'text_top' => 'Статистика показов рекламного блока',
                'title' => 'statistic'
            ]
        );
    }
    public function actionClick()
    {
        if (!(isset($_GET['id']) && preg_match("/^[\d]+$/", $_GET['id']))) {
            echo 'Error';
            return;
        }

        $statistic_model = new StatisticModel();
        $content = $statistic_model->getClickByAdUnit($_GET['id']);

        $quantity = $statistic_model->quantityClick($_GET['id']);

        $this->view(
            'statistic',
            [
                'content' => $content,
                'quantity' => $quantity,
                'text_top' => 'Статистика кликов по рекламному блоку',
                'title' => 'statistic'
            ]
        );
    }
    public function actionGroup()
    {
        $group_list = [
            '1' => ['groupDate','Дата'],
            '2' => ['groupAdUnit','Рекламный блок'],
            '3' => ['groupRecourse','Интернет-ресурс'],
            '4' => ['groupIso','Код страны']
        ];
        if (!(isset($_GET['group']) && array_key_exists($_GET['group'], $group_list))) {
            $_GET['group'] = 1;
        }
        $function = $group_list[$_GET['group']][0];


        $statistic_model = new StatisticModel();
        $content = $statistic_model->$function();

        $statistic = [];
        foreach ($content[0] as $item) {
            $statistic[$item[$content[2]]]['view'] = $item["COUNT('num')"];
        }
        foreach ($content[1] as $item) {
            $statistic[$item[$content[2]]]['click'] = $item["COUNT('num')"];
        }


        $this->addScript('statistic');
        $this->view(
            'statistic-group',
            [
                'content' => $statistic,
                'title' => 'Общая статистика',
                'group_text' =>$group_list[$_GET['group']][1]
            ]
        );

    }
}
