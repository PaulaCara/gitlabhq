class Spinach::Features::ProjectEditLabels < Spinach::FeatureSteps
  include SharedAuthentication
  include SharedProject
  include SharedPaths

  step 'I should see "bug" in labels list' do
    within ".issue-show-labels.pull-right" do
      page.should have_content "bug"
    end
  end

  step 'I should see "feature" in labels list' do
    within ".issue-show-labels.pull-right" do
      page.should have_content "feature"
    end
  end

  step 'I select "enhancement" from select issue labels' do
    select 'enhancement', from: "issue_label_ids"
  end

  step 'I should see "enhancement" in labels list' do
    within ".issue-show-labels.pull-right" do
      page.should have_content "enhancement"
    end
  end

  step 'I should not see "enhancement" in labels list' do
    within ".issue-show-labels.pull-right" do
      page.should_not have_content "enhancement"
    end
  end

  step 'I should not see "bug" in labels list' do
    within ".issue-show-labels.pull-right" do
      page.should_not have_content "bug"
    end
  end

  step 'I should see "bug" in select issue labels' do
    within "#issue_label_ids" do
      page.should have_content "bug"
    end
  end

  step 'I click on "bug" remove link' do
    within ".issue-show-labels.pull-right" do
      page.find(:xpath, "//span[@class='label color-label']/a[@label_name='bug']/i").trigger('click')
    end
  end

  step 'project "Shop" has issue "Bugfix1" with labels: "bug", "feature"' do
    project = Project.find_by(name: "Shop")
    issue = create(:issue, title: "Bugfix1", project: project)
    issue.labels << project.labels.find_by(title: 'bug')
    issue.labels << project.labels.find_by(title: 'feature')
  end

  step 'I visit issue "Bugfix1" show page' do
    issue = Issue.find_by(title: "Bugfix1")
    visit project_issue_path(issue.project, issue)
  end
end
