<?php


namespace App\Models\Document\Services;


use App\Models\Document;
use App\Models\Human;

class DocumentFactory
{
    public function create(array $data, Human $human)
    {
        $document = new Document();
        $document->number = $data['number'];
        $document->type = $data['type'];
        $document->human()->associate($human);
        $document->files = [];
        if (isset($data['date'])) $document->date = $data['date'];
        $document->save();
        return $document;
    }
}
