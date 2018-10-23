<?php

namespace project\models;

use project\kernel\system\Model;

class Subjects extends Model
{
    public function getList()
    {
        $result = $this->select("SELECT * FROM `subjects`");
        return $result;
    }
}
