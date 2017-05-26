# Xojo URL Class

Parse URL String in Xojo.

## Usage

```
url = new URL("http://rob:abcd1234@www.example.co.uk/path/index.html?query1=test&silly=willy&field[0]=zero&field[2]=two#test=hash&chucky=cheese")

url.shema    // http
url.domain   // www.example.co.uk
url.userName // rob
url.password // abcd1234
url.path     // /path/index.html
url.params   // {query1=test, silly=willy, field[0]=zero, field[2]=two}
url.hashes   // {test=hash, chucky=cheese}
```

## LICENSE

MIT LICENSE
