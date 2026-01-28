# github-pr

Create github pr using gh cli to the branch specified by the user
Use @.github/PULL_REQUEST_TEMPLATE.md if it exists, otherwise use the example template below
Check diff to the specified branch and use the diff to fill in the template
Make sure to fill each section of the template based on the diff

Example usage:
```
/github-pr feature/add-authentication-checks
```

In that case, the PR will be created from the current branch (base) to the branch `feature/add-authentication-checks` (head)

<example-template>
## Summary

Brief description of the changes in the PR.

## Changes

List of changes made in the PR.

</example-template>