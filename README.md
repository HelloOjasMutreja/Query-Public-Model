1. The application has a **Query** model that allows users to create and upload a query with multiple options.

2. The User and Category models are also present, a query belongs to a user and a category.

3. When a user views a query's show page, they have the option to add the query to their daily decision list.

4. The application has a DailyDecision model that sets a query as a daily decision when a user clicks the "Add to Daily Decisions" button on the query's show page.

5. The DailyDecisionList model is created for every user after they sign up, it has all the queries that are set as daily decisions by the user.

6. The daily decision list page, which is accessible via a link on the navigation bar, allows the user to view their daily decision list, edit which queries remain in the list, and add/remove queries.

7. The daily decisions added to daily decision list stay and the rest of them get destroyed after 7 days.

8. The application uses a combination of Rails scaffolding and custom models and controllers to handle the functionality you described. When a user wants to add a query to their daily decision list, the application creates a new DailyDecision record with the user_id and query_id it also renders the daily decision list page where user can see the list and can update or delete the queries that he added.
