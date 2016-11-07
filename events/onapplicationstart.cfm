<cflock scope="application" timeout="30">
  <!--- defualts for our parameter names in the url, can be overridden --->
  <cfparam name="application.lists.params.page" type="string" default="p" />
  <cfparam name="application.lists.params.sort" type="string" default="s" />
  <cfparam name="application.lists.params.direction" type="string" default="d" />
  <cfparam name="application.lists.params.search" type="string" default="search" />

  <!--- partial defaults --->
  <cfparam name="application.lists.partials.list" type="string" default="/partials/list" />
  <cfparam name="application.lists.partials.listhead" type="string" default="/partials/listhead" />
  <cfparam name="application.lists.partials.listitem" type="string" default="/partials/listitem" />
  <cfparam name="application.lists.partials.nolistitems" type="string" default="/partials/nolistitems" />
  <cfparam name="application.lists.partials.search" type="string" default="/partials/search" />
  <cfparam name="application.lists.partials.pagination" type="string" default="/partials/pagination" />

  <!--- defaults for the css icons to use for arrow when sorting is allowed --->
  <cfparam name="application.lists.rendering.sorting.icons.up" type="string" default="ion ion-arrow-up-b" />
  <cfparam name="application.lists.rendering.sorting.icons.down" type="string" default="ion ion-arrow-down-b" />

  <!--- defaults for the table classes to add in --->
  <cfparam name="application.lists.rendering.table.class" type="string" default="table table-striped" />
</cflock>
