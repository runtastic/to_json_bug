How to reproduce
================
                                                                                                                                       
Run `rake db:migrate`.
                                                                                                                                       
Run this code in rails console. It will fetch all records from the model an then fail with a `SystemStackError: stack level too deep` error.

```
1.9.3-p194 :006 > { asdf: Bug }.to_json
DEPRECATION WARNING: Using #scope without passing a callable object is deprecated. For example `scope :red, where(color: 'red')` should be changed to `scope :red, -> { where(color: 'red') }`. There are numerous gotchas in the former usage and it makes the implementation more complicated and buggy. (If you prefer, you can just define a class method named `self.red`.). (called from <class:Bug> at /tmp/json_bug/app/models/bug.rb:9)
  Bug Load (0.1ms)  SELECT "bugs".* FROM "bugs"
SystemStackError: stack level too deep

```

Code in model "Bug" that triggers this problem:

* setting the table name: `set.table_name = "bugs"`
* define scopes without lambdas: `scope where(name: "buggy")
* protect attributes with attr_protected (attr_accessible works though)


We know that attr_protected/attr_accessible are kind of deprecated in favor of strong parameters, but this issue is still present and it is a real issue on rails 3.2.x.

Also rails 4.0 points out that you should use the lambda syntax for scopes, but the db query is really painful on large tables and rails 3.2.x doesn't even raise a warning.

