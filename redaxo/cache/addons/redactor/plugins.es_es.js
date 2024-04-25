let redactorLang = "es";

let redactorTranslations = {
    "cancel": "Cancel",
    "edit": "Edit",
    "insert": "Add",
    "save": "Save",
    "unlink": "Remove link",
    "alignment_center_title": "Align text centered",
    "alignment_left_title": "Align text left",
    "alignment_justify_title": "Justify",
    "alignment_right_title": "Align text right",
    "alignment_title": "Alignment",
    "blockquote_title": "Quote",
    "blockquote_tooltip": "Quote",
    "bold_title": "B",
    "bold_tooltip": "Bold",
    "cleaner_title": "Remove formatting",
    "cleaner_tooltip": "Remove formatting",
    "clip_title": "Clips",
    "clip_tooltip": "Clips",
    "deleted_title": "S",
    "deleted_tooltip": "Remove",
    "format_title": "Format",
    "format_tooltip": "Format",
    "h1_title": "H1",
    "h1_tooltip": "Heading 1",
    "h2_title": "H2",
    "h2_tooltip": "Heading 2",
    "h3_title": "H3",
    "h3_tooltip": "Heading 3",
    "h4_title": "H4",
    "h4_tooltip": "Heading 4",
    "h5_title": "H5",
    "h5_tooltip": "Heading 5",
    "h6_title": "H6",
    "h6_tooltip": "Heading 6",
    "hr_title": "Horizontal rule",
    "image_title": "Image",
    "indent_title": "&gt; Indent",
    "italic_title": "I",
    "italic_tooltip": "Italic",
    "link_title": "Link",
    "link_insert": "Insert link",
    "link_unlink": "Remove link",
    "linkEmail_label_email": "Email",
    "linkEmail_label_text": "Text",
    "linkEmail_title": "Insert email as link",
    "linkEmail_tooltip": "Insert email as link",
    "linkInternal_title": "Open linkmap",
    "linkMedia_title": "link medium",
    "linkTelephone_label_number": "Phone",
    "linkTelephone_label_text": "Text",
    "linkTelephone_notice_number": "International notation (+4969123456789)",
    "linkTelephone_title": "Insert phone number as link",
    "linkTelephone_tooltip": "Insert phone number as link",
    "linkYForm_title": "YForm",
    "lists_title": "Lists",
    "ol_title": "1. ordered List",
    "outdent_title": "&lt; Outdent",
    "quote_cancel": "Cancel",
    "quote_insert": "Insert",
    "quote_label_author": "Author",
    "quote_label_cite": "Reference",
    "quote_label_text": "Quote",
    "pre_title": "Code",
    "pre_tooltip": "Code",
    "redo_title": "Redo",
    "redo_tooltip": "Redo",
    "style_title": "Text styles",
    "style_code_title": "Code",
    "style_mark_title": "Marked",
    "style_kbd_title": "Keyboard input",
    "style_sub_title": "Subscript",
    "style_sup_title": "Superscript",
    "style_var_title": "Variable",
    "subscript_title": "Sub",
    "subscript_tooltip": "Subscript",
    "superscript_title": "Sup",
    "superscript_tooltip": "Superscript",
    "ul_title": "\u2022 Unordered list",
    "underline_title": "U",
    "underline_tooltip": "Underlined",
    "undo_title": "Undo",
    "undo_tooltip": "Undo",
    "vendor_chars": "Chars",
    "vendor_words": "Words",
    "vendor_fontcolor": "Fontcolor",
    "vendor_text": "Text",
    "vendor_highlight": "Highlight",
    "vendor_fontfamily": "Font family",
    "vendor_remove_font_family": "Remove font family",
    "vendor_size": "Font size,",
    "vendor_remove_size": "Remove font size",
    "vendor_fullscreen": "Fullscreen",
    "vendor_properties": "Properties",
    "vendor_specialchars": "Special Characters",
    "vendor_table": "Table",
    "vendor_insert_table": "Insert table",
    "vendor_insert_row_above": "Insert row above",
    "vendor_insert_row_below": "Insert row below",
    "vendor_insert_column_left": "Insert column left",
    "vendor_insert_column_right": "Insert column right",
    "vendor_add_head": "Add head",
    "vendor_delete_head": "Delete head",
    "vendor_delete_column": "Delete column",
    "vendor_delete_row": "Delete row",
    "vendor_delete_table": "Delete table",
    "vendor_change_text_direction": "Text direction",
    "vendor_left_to_right": "Left to right",
    "vendor_right_to_left": "Right to left",
    "vendor_video": "Video",
    "vendor_video_html_code": "Video Embed Code or Youtube\/Vimeo Link",
    "vendor_widget": "Widget",
    "vendor_widget_html_code": "Widget HTML Code"
};

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

(function ($R) {
    $R.add('plugin', 'alignment', {
        init: function (app) {
            this.app = app;
            this.opts = app.opts;
            this.lang = app.lang;
            this.block = app.block;
            this.toolbar = app.toolbar;
        },
        // public
        start: function () {
            let dropdown = {};

            dropdown.left = {
                title: redactorTranslations.alignment_left_title,
                api: 'plugin.alignment.set',
                args: 'left'
            };
            dropdown.center = {
                title: redactorTranslations.alignment_center_title,
                api: 'plugin.alignment.set',
                args: 'center'
            };
            dropdown.right = {
                title: redactorTranslations.alignment_right_title,
                api: 'plugin.alignment.set',
                args: 'right'
            };
            dropdown.justify = {
                title: redactorTranslations.alignment_justify_title,
                api: 'plugin.alignment.set',
                args: 'justify'
            };

            var button = this.toolbar.addButton('alignment', {
                title: redactorTranslations.alignment_title
            });
            button.setIcon('<i class="re-icon-alignment"></i>');
            button.setDropdown(dropdown);
        },
        set: function (type) {
            if (type === 'left' && this.opts.direction === 'ltr') {
                return this._remove();
            }

            var args = {
                style: {'text-align': type}
            };

            this.block.toggle(args);
        },

        // private
        _remove: function () {
            this.block.remove({style: 'text-align'});
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'blockquote', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.blockquote_title,
                icon: false,
                tooltip: redactorTranslations.blockquote_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'blockquote'
                }
            };

            this.toolbar.addButton('blockquote', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'bold', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.bold_title,
                icon: true,
                tooltip: redactorTranslations.bold_tooltip,
                api: 'module.inline.format',
                args: {
                    tag: 'b'
                }
            };

            this.toolbar.addButton('bold', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'cleaner', {
        init: function (app) {
            this.app = app;
            this.block = app.block;
            this.inline = app.inline;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.selection = app.selection;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.cleaner_title,
                icon: true,
                tooltip: redactorTranslations.cleaner_tooltip,
                api: 'plugin.cleaner.format'
            };

            let button = this.toolbar.addButton('cleaner', obj);
            button.setIcon('<i class="fa fa-eraser"></i>');
        },

        format: function () {
            if (this.selection.is()) {
                this.inline.clearFormat();
                this.inline.clearAttr();
                this.inline.clearClass();
                this.inline.clearStyle();

                // get the current selection
                // let html = this.selection.getHtml();

                // Strip out html
                // html = html.replace(/(<([^>]+)>)/ig, "");
                //
                // this.insertion.set(html);
            }
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'clip', {
        init: function (app) {
            this.opts = app.opts;
            this.insertion = app.insertion;
            this.toolbar = app.toolbar;

            if ('redaxo' in this.opts && 'clip' in this.opts.redaxo) {
                this.clipopts = app.opts.redaxo.clip;
            } else {
                return false;
            }
        },

        // public
        start: function () {
            let dropdown = {};

            $.each(this.clipopts, function (i, data) {
                let title = data[0];
                let clip = data[1];

                dropdown[i] = {
                    title: title,
                    api: 'plugin.clip.set',
                    args: clip
                };
            });

            let obj = {
                title: redactorTranslations.clip_title,
                icon: true,
                tooltip: redactorTranslations.clip_tooltip
            };
            // Don't use name like clip. This has a conflict with the vendor.
            let button = this.toolbar.addButton('for-clip', obj);
            button.setIcon('<i class="re-icon-clips"></i>');
            button.setDropdown(dropdown);
        },

        set: function (data) {
            this.insertion.insertHtml(data);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'deleted', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.deleted_title,
                icon: true,
                tooltip: redactorTranslations.deleted_tooltip,
                api: 'module.inline.format',
                args: {
                    tag: 'del'
                }
            };

            this.toolbar.addButton('deleted', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'format', {
        init: function (app) {
            this.opts = app.opts;
            this.block = app.block;
            this.selection = app.selection;
            this.toolbar = app.toolbar;

            let opts = this.opts.formatting;
            if ('redaxo' in this.opts && 'format' in this.opts.redaxo) {
                opts = app.opts.redaxo.format;
            }

            $.each(opts, function (i, data) {
                if (typeof data === 'string') {
                    opts[i] = [data, data];
                }
            });

            this.formatopts = opts;
        },

        // public
        start: function () {
            let dropdown = {};

            $.each(this.formatopts, function (i, data) {
                let title = data[0];
                let tag = data[0];
                let cssClass = '';

                if (data.length >= 2) {
                    let params = data[1].split('.');
                    tag = params[0];

                    if (params.length === 2) {
                        cssClass = params[1];
                    }
                }

                if (cssClass !== '') {
                    title = '<span class="' + cssClass + '">' + title + '</span>';
                }

                dropdown[i] = {
                    title: title,
                    api: 'plugin.format.set',
                    args: {
                        tag: tag,
                        cssClass: cssClass
                    }
                };
            });

            let obj = {
                title: redactorTranslations.format_title,
                icon: true,
                tooltip: redactorTranslations.format_tooltip
            };
            // Don't use name like format. This has a conflict with the vendor.
            let button = this.toolbar.addButton('for-format', obj);
            button.setIcon('<i class="re-icon-format"></i>');
            button.setDropdown(dropdown);
        },

        set: function (data) {
            let args = {
                'tag': data.tag,
                'type': 'toggle'
            };

            if (data.cssClass !== '') {
                args.class = data.cssClass;
            }
            let block = this.selection.getBlock();
            let element = $R.dom(block);
            element.removeAttr('class');
            this.block.format(args);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'h1', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.h1_title,
                icon: false,
                tooltip: redactorTranslations.h1_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'h1'
                }
            };

            this.toolbar.addButton('h1', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'h2', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.h2_title,
                icon: false,
                tooltip: redactorTranslations.h2_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'h2'
                }
            };

            this.toolbar.addButton('h2', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'h3', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.h3_title,
                icon: false,
                tooltip: redactorTranslations.h3_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'h3'
                }
            };

            this.toolbar.addButton('h3', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'h4', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.h4_title,
                icon: false,
                tooltip: redactorTranslations.h4_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'h4'
                }
            };

            this.toolbar.addButton('h4', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'h5', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.h5_title,
                icon: false,
                tooltip: redactorTranslations.h5_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'h5'
                }
            };

            this.toolbar.addButton('h5', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'h6', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.h6_title,
                icon: false,
                tooltip: redactorTranslations.h6_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'h6'
                }
            };

            this.toolbar.addButton('h6', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'hr', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.hr_title,
                api: 'module.line.insert'
            };

            let button = this.toolbar.addButton('hr', obj);
            button.setIcon('<i class="re-icon-line"></i>');
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'html', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: 'HTML',
                icon: true,
                api: 'module.source.toggle'
            };

            this.toolbar.addButton('html', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'image', {
        init: function (app) {
            this.app = app;
            this.opts = app.opts;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.selection = app.selection;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.image_title,
                observe: 'link',
                api: 'plugin.image.open'
            };

            let button = this.toolbar.addButton('image', obj);
            button.setIcon('<i class="rex-icon rex-icon-media"></i>');
        },

        open: function () {
            let params = 'redactor_image';
            if ('redactor_rex_media_getImageTypes' in rex) {
                params += '&args[types]='+rex.redactor_rex_media_getImageTypes.join(',');
            }
            let that = this;
            let mediaPool = openMediaPool(params);
            $(mediaPool).on('rex:selectMedia', function (event, filename) {
                event.preventDefault();
                mediaPool.close();
                let options = {
                    url: rex.redactor_imageUrlPath+filename,
                    label: filename
                };
                that._insert(options);
            });
        },

        // private
        _insert: function (data) {
            if (this.selection.getText() !== '') {
                data.label = this.selection.getText();
            }
            this.insertion.insertRaw('<img src="'+data.url+'" alt="" />');
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'indent', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.indent_title,
                icon: true,
                api: 'module.list.indent',
                observe: 'list'
            };

            this.toolbar.addButton('indent', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'italic', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.italic_title,
                icon: true,
                tooltip: redactorTranslations.italic_tooltip,
                api: 'module.inline.format',
                args: {
                    tag: 'i'
                }
            };

            this.toolbar.addButton('italic', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'linkEmail', {
        init: function (app) {
            this.app = app;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.inspector = app.inspector;
            this.selection = app.selection;
            this.cleaner = app.cleaner;
            this.component = app.component;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.linkEmail_title,
                icon: false,
                tooltip: redactorTranslations.linkEmail_tooltip,
                api: 'plugin.linkEmail.open'
            };

            let button = this.toolbar.addButton('linkEmail', obj);
            button.setIcon('<i class="re-icon-link"></i><i class="fa fa-envelope-o" style="margin-left: .1em; vertical-align: top;"></i>');
        },

        open: function () {
            this.$currentItem = this._getCurrent();

            var options = {
                title: redactorTranslations.linkEmail_title,
                name: 'linkEmailModal',
                width: '500px',
                height: false,
                handle: 'insert',
                commands: {
                    insert: {title: (this.$currentItem) ? redactorTranslations.save : redactorTranslations.insert},
                    cancel: {title: redactorTranslations.cancel,}
                }
            };

            this.app.api('module.modal.build', options);
        },

        onmodal: {
            'linkEmailModal': {
                open: function ($modal, $form) {
                    if (this.selection.getText() !== '') {
                        $form.setData({
                            'linkEmailText': this.selection.getText()
                        });
                    }
                },
                opened: function ($modal, $form) {
                    $form.getField('linkEmailAddress').focus();
                    if (this.$currentItem) {
                        let $el = $R.dom(this.$currentItem);
                        let email = decodeURI($el.attr('href').substring(7));
                        let text = $el.text();
                        $form.getField('linkEmailAddress').val(email);
                        $form.getField('linkEmailText').val(text);
                    }
                },
                insert: function ($modal, $form) {
                    let data = $form.getData();
                    if (this._validateData($form, data)) {
                        this._insert(data);
                    }
                },
            }
        },

        modals: {
            'linkEmailModal': '<form action="">'
                + '<div class="form-item">'
                + '<label>' + redactorTranslations.linkEmail_label_email + ' <span class="req">*</span</label>'
                + '<input name="linkEmailAddress" type="text" />'
                + '</div>'
                + '<div class="form-item">'
                + '<label>' + redactorTranslations.linkEmail_label_text + '</label>'
                + '<input name="linkEmailText" type="text" />'
                + '</div>'
                + '</form>'
        },

        oncontextbar: function (e, contextbar) {

            let data = this.inspector.parse(e.target);
            if (data.isLink()) {
                let node = data.getLink();
                let $el = $R.dom(node);

                let url = $el.attr('href');
                if (url.substring(0, 7) === 'mailto:') {
                    let $point = $R.dom('<a>');

                    $point.text(url.substring(7));
                    $point.attr('href', url);

                    var buttons = {
                        'link': {
                            title: $point,
                            html: url.substring(7)
                        },
                        'edit': {
                            title: redactorTranslations.edit,
                            api: 'plugin.linkEmail.open',
                            args: node
                        },
                        'unlink': {
                            title: redactorTranslations.unlink,
                            api: 'module.link.unlink'
                        }
                    };
                    contextbar.set(e, node, buttons, 'bottom');
                }
            }
        },

        _getCurrent: function () {
            var current = this.selection.getCurrent();
            var data = this.inspector.parse(current);
            if (data.isLink()) {
                return this.component.build(data.getLink());
            }
        },

        _insert: function (data) {
            // close the modal
            this.app.api('module.modal.close');

            // check the data
            if (data.linkEmailAddress.trim() === '') {
                return;
            }
            if (data.linkEmailText.trim() === '') {
                data.linkEmailText = data.linkEmailAddress;
            }

            let current = this._getCurrent();
            if (current) {
                let element = $R.dom(current);
                element.attr('href', 'mailto:'+data.linkEmailAddress);
                element.text(data.linkEmailText);
            } else {
                this.insertion.insertRaw('<a href="mailto:' + data.linkEmailAddress + '">' + data.linkEmailText + '</a>');
            }
        },

        _validateData: function ($form, data) {
            return (data.linkEmailAddress.trim() === '') ? $form.setError('linkEmailAddress') : true;
        },
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'linkExternal', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.link_insert,
                observe: 'link',
                api: 'module.link.open'
            };

            let button = this.toolbar.addButton('linkExternal', obj);
            button.setIcon('<i class="re-icon-link"></i>');
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'linkInternal', {
        init: function (app) {
            this.app = app;
            this.opts = app.opts;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.selection = app.selection;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.linkInternal_title,
                observe: 'link',
                api: 'plugin.linkInternal.open'
            };

            let button = this.toolbar.addButton('linkInternal', obj);
            button.setIcon('<i class="rex-icon rex-icon-open-linkmap"></i>');
        },

        open: function () {
            let that = this;
            let linkMap = openLinkMap('', '&clang=' + rex.redactor_rex_clang_getCurrentId);
            $(linkMap).on('rex:selectLink', function (event, url, label) {
                event.preventDefault();
                linkMap.close();
                label = label.replace(new RegExp(that.opts.redaxo.regex.id, 'gi'), "$1");
                let options = {
                    url: url,
                    label: label
                };
                that._insert(options);
            });
        },

        // private
        _insert: function (data) {
            if (this.selection.getText() !== '') {
                data.label = this.selection.getText();
            }
            this.insertion.insertRaw('<a href="' + data.url + '">' + data.label + '</a>');
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'linkMedia', {
        init: function (app) {
            this.app = app;
            this.opts = app.opts;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.selection = app.selection;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.linkMedia_title,
                observe: 'link',
                api: 'plugin.linkMedia.open'
            };

            let button = this.toolbar.addButton('linkMedia', obj);
            button.setIcon('<i class="re-icon-link"></i><i class="rex-icon rex-icon-media" style="margin-left: .1em; vertical-align: top;"></i>');
        },

        open: function () {
            let that = this;
            let mediaPool = openMediaPool('redactor_linkMedia');
            $(mediaPool).on('rex:selectMedia', function (event, filename) {
                event.preventDefault();
                mediaPool.close();
                let options = {
                    url: rex.redactor_rex_url_media+filename,
                    label: filename
                };
                that._insert(options);
            });
        },

        // private
        _insert: function (data) {
            if (this.selection.getText() !== '') {
                data.label = this.selection.getText();
            }
            this.insertion.insertRaw('<a href="' + data.url + '">' + data.label + '</a>');
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'linkTelephone', {
        init: function (app) {
            this.app = app;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.inspector = app.inspector;
            this.selection = app.selection;
            this.cleaner = app.cleaner;
            this.component = app.component;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.linkTelephone_title,
                icon: false,
                tooltip: redactorTranslations.linkTelephone_tooltip,
                api: 'plugin.linkTelephone.open'
            };

            let button = this.toolbar.addButton('linkTelephone', obj);
            button.setIcon('<i class="re-icon-link"></i><i class="fa fa-phone" style="margin-left: .1em; vertical-align: top;"></i>');
        },

        open: function () {
            this.$currentItem = this._getCurrent();

            var options = {
                title: redactorTranslations.linkTelephone_title,
                name: 'linkTelephoneModal',
                width: '500px',
                height: false,
                handle: 'insert',
                commands: {
                    insert: {title: (this.$currentItem) ? redactorTranslations.save : redactorTranslations.insert},
                    cancel: {title: redactorTranslations.cancel,}
                }
            };

            this.app.api('module.modal.build', options);
        },

        onmodal: {
            'linkTelephoneModal': {
                open: function ($modal, $form) {
                    if (this.selection.getText() !== '') {
                        $form.setData({
                            'linkTelephoneText': this.selection.getText()
                        });
                    }
                },
                opened: function ($modal, $form) {
                    $form.getField('linkTelephoneNumber').focus();
                    if (this.$currentItem) {
                        let $el = $R.dom(this.$currentItem);
                        let email = decodeURI($el.attr('href').substring(4));
                        let text = $el.text();
                        $form.getField('linkTelephoneNumber').val(email);
                        $form.getField('linkTelephoneText').val(text);
                    }
                },
                insert: function ($modal, $form) {
                    let data = $form.getData();
                    if (this._validateData($form, data)) {
                        this._insert(data);
                    }
                },
            }
        },

        modals: {
            'linkTelephoneModal': '<form action="">'
                + '<div class="form-item">'
                + '<label>' + redactorTranslations.linkTelephone_label_number + ' <span class="req">*</span</label>'
                + '<input name="linkTelephoneNumber" type="text" />'
                + '<span class="desc">' + redactorTranslations.linkTelephone_notice_number + '</span>'
                + '</div>'
                + '<div class="form-item">'
                + '<label>' + redactorTranslations.linkTelephone_label_text + '</label>'
                + '<input name="linkTelephoneText" type="text" />'
                + '</div>'
                + '</form>'
        },

        oncontextbar: function (e, contextbar) {

            let data = this.inspector.parse(e.target);
            if (data.isLink()) {
                let node = data.getLink();
                let $el = $R.dom(node);

                let url = $el.attr('href');
                if (url.substring(0, 4) === 'tel:') {
                    let $point = $R.dom('<a>');

                    $point.text(url.substring(4));
                    $point.attr('href', url);

                    var buttons = {
                        'link': {
                            title: $point,
                            html: url.substring(4)
                        },
                        'edit': {
                            title: redactorTranslations.edit,
                            api: 'plugin.linkTelephone.open',
                            args: node
                        },
                        'unlink': {
                            title: redactorTranslations.unlink,
                            api: 'module.link.unlink'
                        }
                    };
                    contextbar.set(e, node, buttons, 'bottom');
                }
            }
        },

        _getCurrent: function () {
            var current = this.selection.getCurrent();
            var data = this.inspector.parse(current);
            if (data.isLink()) {
                return this.component.build(data.getLink());
            }
        },

        _insert: function (data) {
            // close the modal
            this.app.api('module.modal.close');

            // check the data
            if (data.linkTelephoneText.trim() === '') {
                data.linkTelephoneText = data.linkTelephoneNumber;
            }

            let current = this._getCurrent();
            if (current) {
                let element = $R.dom(current);
                element.attr('href', 'tel:'+data.linkTelephoneNumber);
                element.text(data.linkTelephoneText);
            } else {
                this.insertion.insertRaw('<a href="tel:' + data.linkTelephoneNumber + '">' + data.linkTelephoneText + '</a>');
            }
        },

        _validateData: function ($form, data) {
            let regex = /^\+(?:[0-9] ?){6,14}[0-9]$/;
            return regex.test(data.linkTelephoneNumber) ? true : $form.setError('linkTelephoneNumber');
        },
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */


/**
 * = = = = = = = = = = = = = = = = = = = = =
 * Don't use this
 * = = = = = = = = = = = = = = = = = = = = =
 */
(function ($R) {
    $R.add('plugin', 'linkYForm', {
        init: function (app) {
            this.app = app;
            this.opts = app.opts;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.selection = app.selection;

            if ('redaxo' in this.opts && 'linkYForm' in this.opts.redaxo) {
                this.yform = app.opts.redaxo.linkYForm;
            } else {
                return false;
            }
        },

        // public
        start: function () {
            let dropdown = {};

            $.each(this.yform, function(i, data) {
                dropdown[i] = {
                    title: data[0],
                    api: 'plugin.linkYForm.open',
                    args: {
                        table: data[0],
                        label: data[1]
                    }
                };
            });

            let obj = {
                title: redactorTranslations.linkYForm_title,
                api: 'plugin.linkYForm.open'
            };

            let button = this.toolbar.addButton('linkYForm', obj);
            button.setDropdown(dropdown);
        },

        open: function (data) {
            let that = this;
            let eventFired = false;
            let pool = newPoolWindow('index.php?page=yform/manager/data_edit&table_name=' + data.table + '&rex_yform_manager_opener[id]=1&rex_yform_manager_opener[field]=' + data.label + '&rex_yform_manager_opener[multiple]=0');
            $(pool).on('rex:YForm_selectData', function (event, id, label) {
                event.preventDefault();
                pool.close();

                if (!eventFired) {
                    label = label.replace(new RegExp(that.opts.redaxo.regex.id, 'gi'), "$1");
                    let options = {
                        url: data.table.split('_').join('-') + '://' + id,
                        label: label
                    };
                    that._insert(options);
                    eventFired = true;
                }
            });
        },

        // private
        _insert: function (data) {
            if (this.selection.getText() !== '') {
                data.label = this.selection.getText();
            }
            this.insertion.insertRaw('<a href="' + data.url + '">' + data.label + '</a>');
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'lists', {
        init: function (app) {
            this.opts = app.opts;
            this.toolbar = app.toolbar;

            this.listsopts = ['ul', 'ol', 'outdent', 'indent'];

            if ('redaxo' in this.opts && 'lists' in this.opts.redaxo) {
                this.listsopts = app.opts.redaxo.lists;
            }
        },

        // public
        start: function () {

            let dropdown = {
                observe: 'list'
            };

            if (this.listsopts.indexOf('ul') !== -1) {
                dropdown.unorderedlist = {
                    title: redactorTranslations.ul_title,
                    api: 'module.list.toggle',
                    args: 'ul'
                }
            }

            if (this.listsopts.indexOf('ol') !== -1) {
                dropdown.orderedlist = {
                    title: redactorTranslations.ol_title,
                    api: 'module.list.toggle',
                    args: 'ol'
                }
            }

            if (this.listsopts.indexOf('outdent') !== -1) {
                dropdown.outdent = {
                    title: redactorTranslations.outdent_title,
                    api: 'module.list.outdent'
                }
            }

            if (this.listsopts.indexOf('indent') !== -1) {
                dropdown.indent = {
                    title: redactorTranslations.indent_title,
                    api: 'module.list.indent'
                }
            }

            let obj = {
                title: redactorTranslations.lists_title,
                icon: true,
                observe: 'list'
            };

            let button = this.toolbar.addButton('lists', obj);
            button.setDropdown(dropdown);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'ol', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.ol_title,
                icon: true,
                api: 'module.list.toggle',
                observe: 'list',
                args: 'ol'
            };

            this.toolbar.addButton('ol', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'outdent', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.outdent_title,
                icon: true,
                api: 'module.list.outdent',
                observe: 'list'
            };

            this.toolbar.addButton('outdent', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'pre', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.pre_title,
                icon: true,
                tooltip: redactorTranslations.pre_tooltip,
                api: 'module.block.format',
                args: {
                    tag: 'pre'
                }
            };

            this.toolbar.addButton('pre', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'quote', {
        init: function (app) {
            this.app = app;
            this.toolbar = app.toolbar;
            this.insertion = app.insertion;
            this.selection = app.selection;
            this.cleaner = app.cleaner;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.blockquote_title,
                icon: false,
                tooltip: redactorTranslations.blockquote_tooltip,
                api: 'plugin.quote.open',
                args: {
                    tag: 'blockquote'
                }
            };

            this.toolbar.addButton('quote', obj);
        },

        open: function() {
            var options = {
                title: redactorTranslations.quote_title,
                name: 'redaxoModal',
                width: '500px',
                height: false,
                handle: 'insert',
                commands: {
                    insert: { title: redactorTranslations.quote_insert, },
                    cancel: { title: redactorTranslations.quote_cancel, }
                }
            };

            this.app.api('module.modal.build', options);
        },

        onmodal: {
            'redaxoModal': {
                open: function($modal, $form) {
                    if (this.selection.getText() !== '') {
                        $form.setData({
                            'quoteText': this.selection.getText()
                        });
                    }
                },
                opened: function($modal, $form) {
                    $form.getField('quoteText').focus();
                },
                insert: function($modal, $form) {
                    let data = $form.getData();
                    console.log(data);
                    this._insert(data);
                }
            }
        },

        modals: {
            'redaxoModal': '<form action="">'
                + '<div class="form-item">'
                    + '<label>'+redactorTranslations.quote_label_text+'</label>'
                    + '<textarea name="quoteText" style="height: 200px;"></textarea>'
                + '</div>'
                + '<div class="form-item">'
                    + '<label>'+redactorTranslations.quote_label_author+'</label>'
                    + '<input name="quoteAuthor" type="text" />'
                + '</div>'
                + '<div class="form-item">'
                    + '<label>'+redactorTranslations.quote_label_cite+'</label>'
                    + '<input name="quoteCite" type="text" />'
                + '</div>'
            + '</form>'
        },

        _insert: function(data) {
            // close the modal
            this.app.api('module.modal.close');

            // check the data
            if (data.quoteText.trim() === '') {
                return;
            }

            let cite = '';
            if (data.quoteCite.trim() !== '') {
                 cite = '<cite>'+data.quoteCite+'</cite>';
            }

            let author = '';
            if (data.quoteAuthor.trim() !== '') {
                author = data.quoteAuthor;
                if (cite !== '') {
                    author += ', '+cite;
                    cite = '';
                }
                author = '<footer>'+author+'</footer>';
            }

            // insert data with Insertion Service
            this.insertion.insertHtml('<blockquote><div>'+this.cleaner.paragraphize(data.quoteText)+'</div>'+author+cite+'</blockquote>');
        }
    });
})(Redactor);






(function($R)
{
    $R.add('plugin', 'limiter', {
        init: function(app)
        {
            this.app = app;
            this.utils = app.utils;
            this.opts = app.opts;
            this.editor = app.editor;
            this.keycodes = app.keycodes;
        },
        // events
        onpasting: function(html)
        {
            if (!this.opts.limiter) return;

            html = this.utils.removeInvisibleChars(html);

            var text = this._getText();
            var len = html.length + text.length;

			this.opts.input = !(len >= this.opts.limiter);
        },
        // public
        start: function()
        {
			if (!this.opts.limiter) return;
            this._count();

            var $editor = this.editor.getElement();
            $editor.on('keydown.redactor-plugin-limiter', this._limit.bind(this));
		},
		stop: function()
		{
            var $editor = this.editor.getElement();
            $editor.off('.redactor-plugin-limiter');

            this.opts.input = true;
		},

		// private
		_limit: function(e)
		{
    		var key = e.which;
			var ctrl = e.ctrlKey || e.metaKey;
			var arrows = [37, 38, 39, 40];

			if (key === this.keycodes.BACKSPACE
			   	|| key === this.keycodes.DELETE
			    || key === this.keycodes.ESC
			    || key === this.keycodes.SHIFT
			    || (ctrl && key === 65)
			    || (ctrl && key === 88)
			    || (ctrl && key === 82)
			    || (ctrl && key === 116)
			    || (arrows.indexOf(key) !== -1)
			)
			{
				return;
			}

            this._count(e);
		},
		_count: function(e)
		{
            var text = this._getText();
			var count = text.length;
			if (count >= this.opts.limiter)
			{
                if (e) e.preventDefault();
                this.opts.input = false;
				return false;
			}
			else
			{
    			this.opts.input = true;
			}
		},
		_getText: function()
		{
            var $editor = this.editor.getElement();
			var text = $editor.text();

			return this.utils.removeInvisibleChars(text);
		}
    });
})(Redactor);






/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'redo', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.redo_title,
                icon: true,
                api: 'module.buffer.redo'
            };

            this.toolbar.addButton('redo', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', '|', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {};

            let button = this.toolbar.addButton('separator', obj);
            button.hideTooltip();
            button.disable();
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'style', {
        init: function (app) {
            this.opts = app.opts;
            this.toolbar = app.toolbar;

            this.listsopts = ['mark', 'code', 'var', 'kbd', 'sup', 'sub'];

            if ('redaxo' in this.opts && 'style' in this.opts.redaxo) {
                this.listsopts = app.opts.redaxo.style;
            }
        },

        // public
        start: function () {

            let dropdown = {};

            for (let key in this.listsopts) {
                let element = this.listsopts[key];
                let title = 'style_'+element+'_title';
                dropdown[element] = {
                    title: redactorTranslations[title],
                    api: 'module.inline.format',
                    args: element
                }
            }

            let obj = {
                title: redactorTranslations.style_title,
                icon: true,
            };

            let button = this.toolbar.addButton('style', obj);
            button.setIcon('<i class="re-icon-inline"></i>');
            button.setDropdown(dropdown);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'subscript', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.subscript_title,
                icon: true,
                tooltip: redactorTranslations.subscript_tooltip,
                api: 'module.inline.format',
                args: {
                    tag: 'sub'
                }
            };

            this.toolbar.addButton('subscript', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'superscript', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.superscript_title,
                icon: true,
                tooltip: redactorTranslations.superscript_tooltip,
                api: 'module.inline.format',
                args: {
                    tag: 'sup'
                }
            };

            this.toolbar.addButton('superscript', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'ul', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.ul_title,
                icon: true,
                api: 'module.list.toggle',
                observe: 'list',
                args: 'ul'
            };

            this.toolbar.addButton('ul', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'underline', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.underline_title,
                icon: true,
                tooltip: redactorTranslations.underline_tooltip,
                api: 'module.inline.format',
                args: {
                    tag: 'u'
                }
            };

            this.toolbar.addButton('underline', obj);
        }
    });
})(Redactor);

/**
 * This file is part of the redactor package.
 *
 * @author (c) Friends Of REDAXO
 * @author <friendsof@redaxo.org>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */
(function ($R) {
    $R.add('plugin', 'undo', {
        init: function (app) {
            this.toolbar = app.toolbar;
        },

        // public
        start: function () {
            let obj = {
                title: redactorTranslations.undo_title,
                icon: true,
                api: 'module.buffer.undo'
            };

            this.toolbar.addButton('undo', obj);
        }
    });
})(Redactor);
