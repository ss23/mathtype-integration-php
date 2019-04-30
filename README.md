MathType Web Integration PHP library
==========

This repository contains the MathType Web PHP library.

MathType Web PHP library should be used together with a MathType Web HTML editor integration.

Available integrations:
- [CKEditor 5](https://www.npmjs.com/package/@wiris/mathtype-ckeditor5)
- [CKEditor 4](https://www.npmjs.com/package/@wiris/mathtype-ckeditor4)
- [TinyMCE 4](https://www.npmjs.com/package/@wiris/mathtype-tinymce4)
- [Froala](https://www.npmjs.com/package/@wiris/mathtype-froala)
- [Generic Integration](https://www.npmjs.com/package/@wiris/mathtype-generic)

# Install Instructions
## CKEditor 5
1. Install the CKEditor 4 package:
    ```npm
    npm install @wiris/mathtype-ckeditor5
    ```
2. Clone the PHP library:
    ```
    git clone https://github.com/wiris/mathtype-integration-php.git ${WEB_DOCUMENTROOT}
    ```
3. Add the following attribute to CKEditor 5 configuration:
    ```js
    ClassicEditor
        .create( document.querySelector( '#example' ), {
            mathTypeParameters : {
                serviceProviderProperties : {
                    URI : 'http://${WEB_DOCUMENTROOT}/php-services/integration',
                    server : 'php'
                }
            }
        } )
    ```
## CKEditor 4
1. Install the CKEditor 4 package:
    ```npm
    npm install @wiris/mathtype-ckeditor4
    ```
2. Clone the PHP library:
    ```
    git clone https://github.com/wiris/mathtype-integration-php.git ${WEB_DOCUMENTROOT}
    ```
3. Add the following attribute to CKEditor 4 configuration:
    ```js
    CKEDITOR.editorConfig = function( config ) {
        config.mathTypeParameters : {
            serviceProviderProperties : {
                URI : 'http://${WEB_DOCUMENTROOT}/mathtype-integration-php/integration',
                server : 'php'
            }
        }
	}
    ```

## TinyMCE4
1. Install the CKEditor 4 package:
    ```npm
    npm install @wiris/mathtype-tinymce4
    ```
2. Clone the PHP library:
    ```
    git clone https://github.com/wiris/mathtype-integration-php.git ${WEB_DOCUMENTROOT}
    ```
3. Add the following attribute to TinyMCE configuration:
    ```js
    tinymce.init({
        mathTypeParameters : {
            serviceProviderProperties : {
                URI : 'http://${WEB_DOCUMENTROOT}/mathtype-integration-php/integration',
                server : 'php'
            }
        }
	}
    ```
## Froala
1. Install the CKEditor 4 package:
    ```npm
    npm install @wiris/mathtype-froala
    ```
2. Clone the PHP library:
    ```
    git clone https://github.com/wiris/mathtype-integration-php.git ${WEB_DOCUMENTROOT}
    ```
3. Add the following attribute to Froala options:
    ```js
    $('#example').froalaEditor({
        mathTypeParameters : {
            serviceProviderProperties : {
                URI : 'http://${WEB_DOCUMENTROOT}/mathtype-integration-php/integration',
                server : 'php'
            }
        }
	}
    ```
## Generic Integration
1. Install the CKEditor 4 package:
    ```npm
    npm install @wiris/mathtype-generic
    ```
2. Clone the PHP library:
    ```
    git clone https://github.com/wiris/mathtype-integration-php.git ${WEB_DOCUMENTROOT}
    ```
3. Add the following line to genericIntegrationProperties before create the new instance of GenericIntegration class:
    ```js
    genericIntegrationProperties.serviceProviderProperties = {};
    genericIntegrationProperties.serviceProviderProperties.URI = 'http://${WEB_DOCUMENTROOT}/mathtype-integration-php/integration';
    genericIntegrationProperties.serviceProviderProperties.server = 'php';
