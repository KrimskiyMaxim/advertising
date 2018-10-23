<?php

namespace project\controllers;

use project\kernel\system\Controller;
use project\models\AdUnit;
use project\models\Statistic;

class Api extends Controller
{
    public function actionView()
    {
        if (!(isset($_GET['adunit_id']) && isset($_GET['query']) && isset($_GET['countryCode']))) {
            return;
        }

        $adunit = new AdUnit();
        $adunit = $adunit->getAdUnitById($_GET['adunit_id']);

        $staticsic = new Statistic();
        $staticsic->addView(
            $adunit[0]['resource_id'],
            $_GET['adunit_id'],
            time(),
            $_GET['query'],
            $_GET['countryCode']
        );

        return true;

    }
    public function actionClick()
    {
        if (!(isset($_GET['adunit_id']) && isset($_GET['query']) && isset($_GET['countryCode']))) {
            return;
        }


        $adunit = new AdUnit();
        $adunit = $adunit->getAdUnitById($_GET['adunit_id']);

        $staticsic = new Statistic();
        $staticsic->addClick(
            $adunit[0]['resource_id'],
            $_GET['adunit_id'],
            time(),
            $_GET['query'],
            $_GET['countryCode']
        );

        return true;
    }
}
