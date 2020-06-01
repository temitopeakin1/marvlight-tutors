

class Grade{
  
   String title;
   String subtitle;

  Grade({this.title, this.subtitle});
  
 static List<Grade> getGrades() {
    return<Grade>[
      Grade(title: "Grade A", subtitle: "Masters Holder with 6 years Teaching Experience or a Bachelors with 12 Years experience in a particular teaching Subject"),
       Grade(title: "Grade B", subtitle: "Bachelors/HND with 5years Teaching experience and above"),
        Grade(title: "Grade C", subtitle: "Fresh Graduate Bachelors/HND Holders"),
         Grade( title: "Grade D", subtitle: "NCE Holders with 5 years Experience"),

    ];
  }
}

