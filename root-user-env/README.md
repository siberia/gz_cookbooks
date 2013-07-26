root-user-env Cookbook
======================

Configures roots homedir.

Requirements
------------

Attributes
----------

Usage
-----

#### root-user-env::default

e.g.
Just include `root-user-env` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[root-user-env]"
  ]
}
```

Contributing
------------

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: 

 * Jacques Marneweck (jacques@powertrip.co.za)
