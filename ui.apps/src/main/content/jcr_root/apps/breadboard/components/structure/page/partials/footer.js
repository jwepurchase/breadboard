// Server-side JavaScript for the footer.html logic
use(function () {
    var Calendar = Packages.java.util.Calendar;
    var currentYear = Calendar.getInstance().get(Calendar.YEAR);

    return {
        year: currentYear
    };
});