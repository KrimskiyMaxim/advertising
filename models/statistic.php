<?php

namespace project\models;

use project\kernel\system\Model;

class Statistic extends Model
{
    public function addView($resources_id, $adunit_id, $date, $IP, $ISO)
    {
        $this->insert("INSERT INTO `adunit-views` (`id`, `resources_id`, `adunit_id`, `date`, `IP`, `ISO`)
                            VALUES (NULL, '$resources_id', '$adunit_id', '$date', '$IP', '$ISO')");
    }
    public function addClick($resources_id, $adunit_id, $date, $IP, $ISO)
    {
        $this->insert("INSERT INTO `adunit-click` (`id`, `resources_id`, `adunit_id`, `date`, `IP`, `ISO`)
                          VALUES (NULL, '$resources_id', '$adunit_id', '$date', '$IP', '$ISO')");
    }
    public function getViewsByAdUnit($id)
    {
        return $this->select("SELECT * FROM `adunit-views`
                                  WHERE `adunit_id` = $id ORDER BY `id` DESC");
    }
    public function getClickByAdUnit($id)
    {
        return $this->select("SELECT * FROM `adunit-click` 
                                  WHERE `adunit_id` = $id ORDER BY `id` DESC");
    }
    public function quantityView($id)
    {
        return $this->quantity("SELECT * FROM `adunit-views` WHERE `adunit_id` = $id");
    }
    public function quantityClick($id)
    {
        return $this->quantity("SELECT * FROM `adunit-click` WHERE `adunit_id` = $id");
    }
    public function groupDate()
    {
        $views =  $this->select("SELECT *, CONCAT(LEFT(FROM_UNIXTIME(`date`), 10)) Hour, COUNT('num')
                                      FROM `adunit-views` GROUP BY LEFT(FROM_UNIXTIME(`date`), 10)");
        $click =  $this->select("SELECT *, CONCAT(LEFT(FROM_UNIXTIME(`date`), 10)) Hour, COUNT('num')
                                      FROM `adunit-click` GROUP BY LEFT(FROM_UNIXTIME(`date`), 10)");
        return [$views, $click, 'Hour'];
    }
    public function groupAdUnit()
    {
        $views =  $this->select("SELECT *, COUNT('num') FROM `adunit-views` GROUP BY `adunit_id`");
        $click =  $this->select("SELECT *, COUNT('num') FROM `adunit-click` GROUP BY `adunit_id`");
        return [$views, $click, 'adunit_id'];
    }
    public function groupRecourse()
    {
        $views =  $this->select("SELECT *, COUNT('num') FROM `adunit-views` GROUP BY `resources_id`");
        $click =  $this->select("SELECT *, COUNT('num') FROM `adunit-click` GROUP BY `resources_id`");
        return [$views, $click, 'resources_id'];
    }
    public function groupIso()
    {
        $views =  $this->select("SELECT *, COUNT('num') FROM `adunit-views` GROUP BY `ISO`");
        $click =  $this->select("SELECT *, COUNT('num') FROM `adunit-click` GROUP BY `ISO`");
        return [$views, $click, 'ISO'];
    }
}
