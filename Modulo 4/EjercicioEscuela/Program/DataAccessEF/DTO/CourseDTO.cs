﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessEF.Entities
{
    public class CourseDTO
    {
        public int CourseId { get; set; }

        public string CourseName { get; set; }

        public int Credits { get; set; }
    }
}
