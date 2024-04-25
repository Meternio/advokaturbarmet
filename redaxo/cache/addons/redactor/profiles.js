redactor_profiles = {
    "links_only": {
        "redaxo": {
            "regex": {
                "id": "(.*?)\\s\\[.*?\\]"
            }
        },
        "minHeight": "300px",
        "maxHeight": "300px",
        "autoparse": true,
        "autoparseStart": true,
        "autoparsePaste": true,
        "autoparseLinks": true,
        "autoparseImages": true,
        "autoparseVideo": true,
        "buttonsTextLabeled": false,
        "cleanOnEnter": true,
        "cleanInlineOnEnter": false,
        "removeScript": true,
        "removeNewLines": false,
        "removeComments": true,
        "replaceTags": {
            "b": "strong",
            "i": "em",
            "strike": "del"
        },
        "buttons": [],
        "plugins": [
            "linkExternal",
            "linkInternal",
            "linkEmail",
            "linkTelephone",
            "ul",
            "undo",
            "redo"
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
        "autoparse": true,
        "autoparseStart": true,
        "autoparsePaste": true,
        "autoparseLinks": true,
        "autoparseImages": true,
        "autoparseVideo": true,
        "buttonsTextLabeled": false,
        "cleanOnEnter": true,
        "cleanInlineOnEnter": false,
        "removeScript": true,
        "removeNewLines": false,
        "removeComments": true,
        "replaceTags": {
            "b": "strong",
            "i": "em",
            "strike": "del"
        },
        "buttons": [],
        "plugins": [
            "format",
            "linkExternal",
            "linkInternal",
            "linkEmail",
            "linkTelephone",
            "undo",
            "redo"
        ]
    }
};