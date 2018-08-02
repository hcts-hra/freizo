xquery version "3.0";

declare namespace output = "http://www.w3.org/2010/xslt-xquery-serialization";

declare option output:method "html";
declare option output:media-type "text/html";

let $path := replace(request:get-effective-uri(), "index\.xql", "")


return
    <html>
        <head>
            <title>Wiki Data Reports</title>
        </head>
        <body>
            <h1>Wiki Data Reports</h1>
            {
                for $resource-name in xmldb:get-child-resources(replace($path, "/exist/rest", ""))[ends-with(., '.html')]
                order by $resource-name
                
                return <p><a href="{$path || $resource-name}" target="_blank">{$resource-name}</a></p>
            }
        </body>
    </html>
