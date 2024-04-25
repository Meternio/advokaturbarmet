redactor_profiles = {
    "links_only": {
        "redaxo": {
            "regex": {
                "id": "(.*?)\\s\\[.*?\\]"
            }
        },
        "minHeight": "300px",
        "maxHeight": "300px",
        "buttons": [],
        "plugins": [
            "linkExternal",
            "linkInternal",
            "linkEmail",
            "linkTelephone",
            "ul",
            "undo",
            "redo",
            "counter"
        ]
    },
    "links_with_styles": {
        "redaxo": {
            "regex": {
                "id": "(.*?)\\s\\[.*?\\]"
            },
            "format": [
                [
                    "Normal",
                    "p.default"
                ],
                [
                    "Zwischentitel",
                    "p.sub"
                ]
            ]
        },
        "minHeight": "300px",
        "maxHeight": "300px",
        "buttons": [],
        "plugins": [
            "format",
            "linkExternal",
            "linkInternal",
            "linkEmail",
            "linkTelephone",
            "undo",
            "redo",
            "counter"
        ]
    }
};