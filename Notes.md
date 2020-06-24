Models that we'll need:

User
  -username
  -email
  -password_digest
  -has many :jobs

Job
  -belongs_to :user
  -belongs_to :category
  -title
  -content

Categories
  -name
  -has_many :jobs
