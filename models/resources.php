<?php

namespace project\models;

use project\kernel\system\Model;

class Resources extends Model
{
    public function add($subject_id, $url, $contact)
    {
        return $this->insert("INSERT INTO `resources` (`id`, `subject_id`, `url`, `contact`)
                                  VALUES (NULL, '$subject_id', '$url', '$contact')");
    }
    public function edit($resource_id, $subject_id, $url, $contact)
    {
        return $this->query("UPDATE `resources`
                                  SET `subject_id` = '$subject_id', `url` = '$url', `contact` = '$contact'
                                  WHERE `resources`.`id` = $resource_id");
    }
    public function delete($resource_id)
    {
        $this->query("DELETE FROM `resources` WHERE `resources`.`id` = $resource_id");
        return true;
    }
    public function getListAll()
    {
        $result = $this->select('SELECT * FROM `resources`');
        return $result;
    }
    public function getList($page = 1)
    {
        $limit = 15;
        $quantity = $this->quantity('SELECT * FROM `resources`');
        $result['pages'] = ceil($quantity/$limit);

        if ($page > $result['pages']) {
            $page = 1;
        }

        $offset = ($page-1) *$limit;
        $result['data'] = $this->select("SELECT
                                        `resources`.*,
                                        `subjects`.`name` as subject_name
                                    FROM `resources`
                                    JOIN
                                        `subjects`
                                    ON
                                        `subjects`.`id` = `resources`.`subject_id`
                                    ORDER BY `resources`.`id`  DESC LIMIT $limit OFFSET $offset");


        return $result;
    }
    public function getResourceById($resource_id)
    {
        $result = $this->select("SELECT 
                                        `resources`.*,
                                        `subjects`.`name` as subject_name
                                    FROM `resources`
                                    JOIN
                                        `subjects`
                                    ON
                                        `subjects`.`id` = `resources`.`subject_id`
                                    WHERE `resources`.`id` = $resource_id");
        return $result;

    }
}
