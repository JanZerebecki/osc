Feature: `git repo with .osc in commits fails`


Background:
   Given I set working directory to "{context.osc.temp}"
     And I execute git-obs with args "repo clone pool/test-GitPkgA --no-ssh-strict-host-key-checking"
     And I set working directory to "{context.osc.temp}/test-GitPkgA"
     # huh, no .osc is there, does the git functionality even use a .osc?
     And I execute "mkdir .osc"
     And I execute "touch .osc/testfiletocommit"
     And I execute "git add .osc/testfiletocommit"
     And I execute "git commit -m 'Add .osc'"


@destructive
Scenario: osc result command fails due to .osc in commits
    When I execute osc with args "results test:factory/test-GitPkgA"
    Then the exit code is 1
     And stdout is
        """
        """
     And stderr is
        """
	"""

@destructive
Scenario: osc service manualrun command fails due to .osc in commits
    When I execute osc with args "service manualrun"
    Then the exit code is 1
     And stdout is
        """
        """
     And stderr is
        """
        """
