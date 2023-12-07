<?php

use craft\helpers\UrlHelper;

return [
    'endpoints' => [
        'events.json' => function() {
            return [
                'serializer' => 'jsonFeed',
                'elementType' => craft\elements\Entry::class,
                'criteria' => ['section' => 'events'],
                'transformer' => function(craft\elements\Entry $entry) {
                    $image = $entry->eventImage->one()->url;
                    $startDate = $entry->startDate;
                    if ($startDate != null) {
                      $startDate = $entry->startDate->format('Y-m-d');
                      $compareDate = date("Y-m-d");
                      $today_dt = new DateTime($startDate);
                      $event_dt = new DateTime($compareDate);
                      return [
                          'id' => $entry->id,
                          'startDate' => $startDate,
                          'endDate' => $entry->endDate,
                          'eventImage' => $image,
                          'title' => $entry->title,
                          'isThisEventAWorkshop' => $entry->isThisEventAWorkshop,
                          'location' => $entry->location
                      ];
                    }
                },
                'pretty' => true
            ];
        }
    ]
];
