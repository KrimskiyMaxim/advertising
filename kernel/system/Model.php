<?php

namespace project\kernel\system;

class Model
{
    public $connect;

    public function __construct()
    {
        @$this->connect = new \mysqli(DB_HOST, DB_USER, DB_PASS, DB_BASE,DB_PORT);
        if ($this->connect->connect_error) {
            die('Ошибка подключения (' . $this->connect->connect_errno . ') '
                . $this->connect->connect_error);
        }
    }
    public function query($sql)
    {
        $result = $this->connect->query($sql);
        return $result;
    }
    public function select($sql)
    {
        $result = $this->connect->query($sql);

        $array = [];
        while ($row = $result->fetch_assoc()) {
            $array[] = $row;
        }

        return $array;
    }
    public function insert($sql)
    {
        $this->connect->query($sql);
        return $this->connect->insert_id;

    }
    public function quantity($sql)
    {
        $result = $this->connect->query($sql);
        return $result->num_rows;
    }
    public function __destruct()
    {
        @$this->connect->close();
    }
}
