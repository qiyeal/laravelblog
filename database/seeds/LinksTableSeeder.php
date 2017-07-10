<?php

use Illuminate\Database\Seeder;

class LinksTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $data = [
            [
                'link_name' => 'jrhuei',
                'link_title' => '有情怀的程序员',
                'link_url' => 'http://www.jrhuei.com',
                'link_order' => 1,
            ],
            [
                'link_name' => 'linxiao',
                'link_title' => 'phper',
                'link_url' => 'http://www.jrhuei.com',
                'link_order' => 2,
            ]
        ];
        DB::table('links')->insert($data);
    }
}
