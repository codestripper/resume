using System;

namespace resume.Models {
    public class PhonebookEntry
    {
        public string UserID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string EmailAddress { get; set; }
        public string WorkNumber { get; set; }
        public string JobTitle { get; set; }
        public string Department { get; set; }
        public string Shift { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }

        public PhonebookEntry(string loginId, string firstName, string lastName, string emailAddress, string phoneNumber, string jobTitle, string department, string shift, TimeSpan startTime, TimeSpan endTime) {
            if (!string.IsNullOrEmpty(loginId)) {
                UserID = loginId.Split("\\")[1];
            } else {
                UserID = "NotFound";
            }
            FirstName = firstName;
            LastName = lastName;
            EmailAddress = emailAddress;
            WorkNumber = phoneNumber;
            JobTitle = jobTitle;
            Department = department;
            Shift = shift;
            StartTime = startTime;
            EndTime = endTime;
        }

    }
}

