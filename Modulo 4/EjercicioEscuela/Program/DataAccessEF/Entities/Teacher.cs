﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessEF.Entities
{
    public class Teacher
    {
        public string Names { get; set; }

        public string LastName { get; set; }

        public string SecondLastName { get; set; }

        public int TeacherId { get; set; }

        public int PhoneNumber { get; set; }

        public string Email { get; set; }

        public virtual ICollection<Class> Classes { get; set; }

        public DateTime Birthday { get; set; }

        public bool IsActive { get; set; }

        public DateTime LeavingDate { get; set; }

        public DateTime HireDate { get; set; }
    }
}