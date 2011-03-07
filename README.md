#Correspondence
####Next generation associations

##Todo
* `one` associations<br/>
  Support defining a class and method to find associated object
* `many` assocations<br/>
  Support defining a class and finding multiple related objects
* Arbitrary item `many` associations<br/>
  Support finding N arbitrary objects related to the querying object
* Automagically inferring inverse relationships.

##Usage
    class User
      corresponds_with :profile
    end

This will create a `profile` method on any instance of the user class. By
default the `profile` method will call `Profile.find(id)` where `id` is a
method on the user class.

###Options
* `:class_name` specify a string for the association class name.
* `:class` allows specifying a string, class, symbol or proc.  Symbols must be
  class methods on the associating class, procs should resolve to the
  association class.
* `:on` a symbol or string specifying the method that should be called on the
  associating class as a reference to the association.
* `:using` a symbol or string that is the method that will be called on the
  association call.  This method will be passed the results of `:on`.
