<?php

namespace project\models;

use project\kernel\system\Model;

class AdUnit extends Model
{
    public function add($name, $description, $resource_id)
    {
        return $this->insert("INSERT INTO `adunit` (`id`, `resource_id`, `name`, `description`) 
                                  VALUES (NULL, '$resource_id', '$name', '$description')");
    }
    public function edit($adunit_id, $name, $description, $resource)
    {
        return $this->query("UPDATE `adunit` 
                                  SET `resource_id` = '$resource', `name` = '$name', `description` = '$description' 
                                  WHERE `adunit`.`id` = $adunit_id");
    }
    public function delete($adunit_id)
    {
        $this->query("DELETE FROM `adunit` WHERE `adunit`.`id` = $adunit_id");
        return true;
    }
    public function getList($page = 1)
    {
        $limit = 15;
        $quantity = $this->quantity('SELECT * FROM `adunit`');
        $result['pages'] = ceil($quantity/$limit);

        if ($page > $result['pages']) {
            $page = 1;
        }

        $offset = ($page-1) *$limit;
        $result['data'] = $this->select("SELECT `adunit`.*, `resources`.`url`,`resources`.`contact` FROM `adunit`
                                            JOIN
                                            `resources`
                                            ON
                                            `resources`.`id` = `adunit`.`resource_id`
                                            ORDER BY `adunit`.`id`  DESC LIMIT $limit OFFSET $offset");


        return $result;
    }
    public function getAdUnitById($adunit_id)
    {
        $result = $this->select("SELECT `adunit`.*, `resources`.`url`,`resources`.`contact` FROM `adunit`
                                            JOIN
                                            `resources`
                                            ON
                                            `resources`.`id` = `adunit`.`resource_id`
                                    WHERE `adunit`.`id` = $adunit_id");
        return $result;
    }
}
