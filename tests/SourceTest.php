<?php
use PHPUnit\Framework\TestCase;
require_once __DIR__ . '/../models/Database.php';
require_once __DIR__ . '/../models/Source.php';

class SourceTest extends TestCase {

    public function testCanTiktokSourceBeSelected() {

        $feedId = 1;
        $testSource = [
            [
                'tiktok_source_id' => 1,
                'fan_count' => 500,
                'name' => 'TikTok Source 1',
            ],
            [
                'tiktok_source_id' => 2,
                'fan_count' => 1000,
                'name' => 'TikTok Source 2',
            ],
        ];

        $db = new Database();
        $source = new Source($db);
        $sourceData = $source->getTiktokSources($feedId);

        $this->assertIsArray($sourceData);
        $this->assertSame($testSource, $sourceData);
    }

    public function testCanInstagramourceBeSelected() {

        $feedId = 1;
        $testSource = [
            [
                'instagram_source_id' => 1,
                'fan_count' => 1000,
                'name' => 'Instagram Source 1',
            ],
            [
                'instagram_source_id' => 2,
                'fan_count' => 2000,
                'name' => 'Instagram Source 2',
            ],
        ];

        $db = new Database();
        $source = new Source($db);
        $sourceData = $source->getInstagramSources($feedId);

        $this->assertIsArray($sourceData);
        $this->assertSame($testSource, $sourceData);
    }
}