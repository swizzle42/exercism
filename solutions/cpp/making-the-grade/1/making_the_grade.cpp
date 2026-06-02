#include <array>
#include <string>
#include <vector>
#include <algorithm>

// Round down all provided student scores.
std::vector<int> round_down_scores(std::vector<double> student_scores)
{
    // TODO: Implement round_down_scores
    std::vector<int> int_scores;
    int_scores.reserve(student_scores.size());

    std::transform(student_scores.begin(), student_scores.end(),
                   std::back_inserter(int_scores),
                   [](double score)
                   { return static_cast<int>(score); });

    return int_scores;
}

// Count the number of failing students out of the group provided.
int count_failed_students(std::vector<int> student_scores)
{
    // TODO: Implement count_failed_students
    std::vector<int> failed_students;

    std::copy_if(student_scores.begin(), student_scores.end(),
                 std::back_inserter(failed_students),
                 [](int score)
                 { return score <= 40; });

    return failed_students.size();
}

// Create a list of grade thresholds based on the provided highest grade.
std::array<int, 4> letter_grades(int highest_score)
{
    // TODO: Implement letter_grades
    const int interval = (highest_score - 40) / 4;

    return {
        41,
        41 + (interval * 1),
        41 + (interval * 2),
        41 + (interval * 3)};
}

// Organize the student's rank, name, and grade information in ascending order.
std::vector<std::string> student_ranking(
    std::vector<int> student_scores, std::vector<std::string> student_names)
{
    // TODO: Implement student_ranking
    std::vector<std::string> rankings;

    std::transform(student_names.begin(),
                   student_names.end(),
                   student_scores.begin(),
                   std::back_inserter(rankings),
                   [idx = 0](std::string name, int score) mutable
                   {
                       idx++;
                       return std::to_string(idx) + ". " + name + ": " + std::to_string(score);
                   });

    return rankings;
}

// Create a string that contains the name of the first student to make a perfect
// score on the exam.
std::string perfect_score(std::vector<int> student_scores,
                          std::vector<std::string> student_names)
{
    // TODO: Implement perfect_score

    for (int i = 0; i < student_scores.size(); ++i)
    {
        if (student_scores[i] == 100)
        {
            return student_names[i];
        }
    }

    return "";
}
