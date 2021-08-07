<?php


namespace App\Models\Document\Services;


use App\Models\Document;
use App\Models\Human;
use Illuminate\Support\Facades\Storage;

class DocumentManager
{
    private $documentFactory;

    public function __construct(DocumentFactory  $documentFactory)
    {
        $this->documentFactory = $documentFactory;
    }

    public function updateFields(Document $document, array $data)
    {
        if (isset($data['number'])) $document->number = $data['number'];
        if (isset($data['date'])) $document->date = $data['date'];
        if (isset($data['type'])) $document->type = $data['type'];
        $document->save();
    }

    public function handleFiles(Document $document, array $files = null): void
    {
        if (!is_iterable($files)) return;
        $docFiles = [];
        $disk = Storage::disk('documents');
        foreach ($files as $file) {
            $docFiles[] = 'storage/documents/'.$disk->putFile(null, $file);
        }
        $document->files = $docFiles;
        $document->save();
    }

    public function handleDocuments(array $data = null, Human $human): void
    {
        if (!is_iterable($data)) return;
        foreach ($data as $item) {
            $doc = $this->documentFactory->create($item, $human);
            $this->handleFiles($doc, @$item['files']);
        }
    }
}
