Click the wiki link to learn __[how to setup application locally.](https://github.com/joepuli/icare/wiki)__

Attachment B
ADPQ Technical Write-up

Introduction
This technical write-up describes the Foster Parent Support Application (FPSA).  The FPSA is a working prototype that resides in the AWS cloud.

It may be found here: http://adpq.qualapps.com.  

Source code and configuration files may be found here: https://github.com/joepuli/icare

Information within this document also resides in the readme.md located within the root directory of the AWS-hosted solution.  Also included in our repository are a handful of artifacts following the US Digital Services Playbook that were integral to FPSA development.

Product Overview

The FPSA is a working application that allows parents of foster kids to establish and manage their profile, view children's residential facilities in their zip code, and communicate with the case worker via a private inbox. The FPSA accesses open data through the HHS API to retrieve data about foster family agency locations.  As a prototype, the FPSA does not implement authentication or authorization.

Development Approach and Process

This section addresses requirements labeled A - Q in Section 2 Technical Requirements of the RFI.
a. Assigned a single leader.
Joe Puli, a Technical Architect and Managing Partner of QualApps, accepted full responsibility for the development of FPSA.  

b. Assemble multidisciplinary and collaborative team
The team that QualApps assembled is composed of five individuals each of whom served in one or more ADPQ labor categories to design, build, test, and deploy FPSA:

1. Joe Puli - Product Manager and Technical Architect.
2. Manmohit Atwal -  Front End and Back End Web Developer.  
3. Jigish Parikh - DevOps Engineer.  
4. Eric Steen - Interaction Designer / User Researcher / Usability Tester and Business Analyst.  
5. Suresh Kannan - Delivery Manager.

c. Understood what people needed
d. Used "human-centered design"
g. Used an iterative approach
Optimism and Collaboration.  It's not often that a consulting organization enthusiastically embraces a procurement process.  In this case the team was enthusiastic for a couple of reasons.  We did not have to develop endless documents outlining corporate experience and describing methodologies.  We didn't spend hours formatting resumes, creating fictitious schedules and project management artifacts.  We didn't have to develop topology diagrams and fret about material deviations.  Instead, we got to do what we love working together to solve a problem and build working software.  We cite this because human-centered design, we believe, requires both optimism and collaboration.

Inspiration and Ideation. The team started by putting itself in the shoes of foster parents, leveraging the experience of one of the team members who has fostered and adopted multiple children.  
The team primarily focused on the needs of foster parents, but also considered viewpoints of placement organizations.  The team even considered options for prospective foster families to post online profiles available to agencies, expecting mothers interested in adoption, and foster children.  Although ultimately deemed out-of-scope, the architecture can support such add-ons at a later date.
Iterative. Once the team agreed upon the high-level requirements it collaborated on a set of wireframes that depicted the user interfaces that facilitate an intuitive and joyful user experience.  The team iterated through a number of mockups to evaluate the experience and streamline navigation.  This same iterative process was employed once the wireframes were implemented in a working prototype.  

Prototyping.  Our Product Manager took the lead on helping the team loop through various changes until we settled on what the team considered was functional, intuitive, aesthetically pleasing. We developed three prototypes, each one incorporated more features and sought to meet the needs of key stakeholders.  

Testing.  Our testing process focused on the experience of the foster parents in terms of simplicity, ease-of-use, response time, and conveying clear results.

e. Used a design style guide and/or a pattern library
Used bootstrap framework; leveraged existing template that is extensible.

f. Performed usability tests with people  
Multiple team members put themselves in the shoes of foster parents and tested the application. Immediate feedback was provided to the rest of the team based on what worked, what didn't, and what might function more effectively.  For example, one issue that emerged was that in some cases queries returned multiple agencies, some of which are closed.  To improve the user experience, we logged an issue to ensure that closed facilities are clearly marked in result sets.

h. Multiple devices and responsive design
The solution is responsive and therefore accessible by multiple devices.

i. Five modern, open source technologies
The solution runs on NgineX, MongoDB, Ruby on Rails, Bootstrap, JQuery, and is hosted on Amazon Web Services.  We used Jenkins for build management and automated deployment.  Our solution relies on the Github public repository for configuration management.  The team used Google Hangout and Skype for collaboration when colocation was not possible.

j. Deployed on Iaas or Paas
The FPSA is hosted on Amazon Web Services.

k. Automated unit tests.
We developed a handful of unit test harnesses that were incorporated into the code.  Upon deployment, tests are executed verifying deployment reliability.

l. Continuous Integration (CI)
The FPSA relies on Jenkins for CI, enabling automated testing and deployment to the AWS environment.

m. Configuration Management (CM)
The solution relies on GitHub for CM.

n. Continuous monitoring
Amazon provides a number of monitoring tools.  We selected CloudWatch to monitor Monitor Resources and Applications.  In the interest of time we only setup infrastructure level monitoring CPU, memory, etc.  We could expand monitoring to be more robust and granular, e.g., nagios, sensu, zabbix.  

o. Container deployment (OS-level virtualization)
For the solution we established multiple virtual machines.  The NGINX server upon which our RoR application resides is dockerized.

p. Installation instructions
Installation instructions are located in the github repository here: https://github.com/joepuli/icare/wiki

q.  Openly licensed and free of charge

All products and tools are open source, based on open standards, and free of charge except for the AWS deployment.
