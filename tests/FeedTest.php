<?php
use PHPUnit\Framework\TestCase;

use function PHPUnit\Framework\assertTrue;

require_once __DIR__ . '/../models/Database.php';
require_once __DIR__ . '/../models/Feed.php';

class FeedTest extends TestCase {

    public function testCanBeSelected() {
        
        $testFeed = [
            'id' => 1,
            'name' => 'Feed 1'
        ];

        $db = new Database();
        $feed = new Feed($db);
        $feedData = $feed->getFeed($testFeed['id']);

        $this->assertIsArray($feedData);
        $this->assertSame($testFeed, $feedData);
    }

    public function testCanBeInserted() {

        $db = new Database();
        $feed = new Feed($db);
        $feed->insertFeed('', 'Feed 99999');

        $this->assertTrue(!$db->isError);
    }
}