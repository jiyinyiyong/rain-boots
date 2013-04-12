
## Rain-boots makes Node plugins communicate 

for CoffeeScript developers.

------

### Usage

Rain-boots uses `Cakefile` to start new tasks.  
All plugins are named `*-boots` so people may recognize them.  
Rain-boots plugins are installed from NPM.  

First, install `rain-boots` from NPM:  

```bash
npm install -g rain-boots
```

Each plugin expose its `eventEmitter` to `Cakefile`.  
Then you may connect different plugins via events.  

### Create a plugin

The module `rain-boots` provies a global `eventEmitter` named `rain`,  
the `boots` variable has some useful functions about file operations.  

```coffee
{rain, boots} = require "rain-boots"

events = require "events"
exports.rain = new events.EventEmitter

exports.rain.on "create event", (some_data) ->
  more_data = do_somthing()
  exports.rain.emit "event end", more_data
```

The it can be referred with code:  

```coffee
that_plugin = require("that_plugin").rain
```

All things are connected with events.  

### Docs in Chinese

Read my issues about my plan:  
https://github.com/jiyinyiyong/rain-boots/issues