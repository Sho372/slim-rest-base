<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';

// Instantiate the app
$settings = require __DIR__ . '/../src/settings.php';
$app = new \Slim\App($settings);

// Register dependencies
require __DIR__ . '/../src/dependencies.php';

// Routes
$app->get('/hello/{name}', function (Request $request, Response $response, array $args) {
    $name = $args['name'];
    $this->logger->addInfo('Something interesting happened');
    $response->getBody()->write("Hello, $name");
    return $response;
});

$app->run();