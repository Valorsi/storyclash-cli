#!/usr/bin/env php
<?php

require_once __DIR__ . '/controllers/CopyController.php';

$controller = new CopyController();
$controller->copy($argv);