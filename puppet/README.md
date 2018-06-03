## Puppet learnings
Concepts about Puppet. Let here just to remember


### include vs class
 If you add a class to the catalog using include, you can not pass in parameters. This limits the flexibility of the class unless you're using a tool like hiera within the class. However, it provides the flexibility of being able to call a class as many times you want throughout your code. You could write include apt a hundred times, and Puppet would never care because if apt had already been included in the catalog, it would just use the already existing copy...
More info: https://ask.puppet.com/question/1911/include-class-vs-execute-class/?answer=1919#post-id-1919

### Roles and profiles
Roles and profiles is a way of structuring your Puppet code. It allows you to differenciate bussines logic and code logic. In Puppet code is bundle into `modules`. This modules can be created by you or installed from third party providers. Modules in Puppet are like `gems` in Ruby or `packages` in Javascript.
The basic idea of `roles` and `profiles` is to differienciate your modules in 3 categories:
1. `modules` These the low level modules that manage resources.
2. `profiles` These group other modules together and form a technology stack that make sense. Like for example `lamp_stack`. In this profile you put all LAMP packages you will need like `Apache`, `PHP`. Another profile could be the database and all their dependencies.
3. `roles`. Roles are hight level Puppet modules. and usually have a 1 to 1 relation with your `nodes`. An example of a Puppet role could be `web`. In this module you would put for example: `lamp_stack`, `front_app` and `database` profiles.

A good talk by the guy who created `roles-profiles` pattern can be found here: https://www.youtube.com/watch?v=ZpHtOnlSGNY