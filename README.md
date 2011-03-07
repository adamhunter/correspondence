#Correspondence
####Next generation associations
Correspondence aims to provide a base for creating associations between
arbitrary ruby classes.  With polyglotting databases on the rise, and
association code specific to the Object Mapper you are using,
Correspondence attempts to bridge the gap.

For example, if you have an `ActiveRecord::Base` class
(lets call it User) that you have associated with a `Ripple::Document` like
profile, implementing `@user.profile` is entirely manual.  As are getters and
queryiers like `@user.profile=` or `@user.profile?`. If you have multiple
associations like this in your codebase it gets messy quick.  
##Goals
* **Not** to be the be all and end all for linking ruby classes together
* Provide a common pattern that is extensible and reusable to link classes
  together

##Todo
* Figure out final draft of DSL
* Get base proxy class working (not just serving up the actual target)
* `one` associations<br/>
  Support defining a class and method to find associated object
* Lazy load and memoize associatated targets
* All association customization down to the owner instance (I think this will
  be hard, maybe not though)
* `many` assocations<br/>
  Support defining a class and finding multiple related objects
* Arbitrary item `many` associations<br/>
  Support finding N arbitrary objects related to the querying object
* Explore the possiblity of using this on an API like twitter, associating a
  `User` object with a set of tweets only via `@user.tweets`
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
  associating class as a reference to the association. Defaults to `:id`.
* `:using` a symbol or string that is the method that will be called on the
  association call.  This method will be passed the results of `:on`. Defaults
  to `:find`.
