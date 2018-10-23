<?php

	return $routes = array(
	   'resources/add' => ['resources', 'add', 'none'],
	   'resources/edit' => ['resources', 'edit', 'none'],
	   'resources/delete' => ['resources', 'delete', 'none'],
	   'resources/id' => ['resources', 'id', 'none'],


        'adunit/add' => ['adunit', 'add', 'none'],
        'adunit/edit' => ['adunit', 'edit', 'none'],
        'adunit/delete' => ['adunit', 'delete', 'none'],
        'adunit/id' => ['adunit', 'id', 'none'],
        'adunit' => ['adunit', 'index', 'none'],


        'statistic/view' => ['statistic', 'view', 'none'],
        'statistic/click' => ['statistic', 'click', 'none'],
        'statistic/group' => ['statistic', 'group', 'none'],


        'API/view' => ['API', 'view', 'none'],
        'API/click' => ['API', 'click', 'none'],

        '' => ['resources', 'index', 'none']
	);
