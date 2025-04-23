import 'dart:convert';

ApiResponse apiResponseFromJson(String str) => ApiResponse.fromJson(json.decode(str));

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  Message message;

  ApiResponse({required this.message});

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(message: Message.fromJson(json["message"]));

  Map<String, dynamic> toJson() => {"message": message.toJson()};
}

class Message {
  int statusKey;
  List<String> exams;
  List<String> examBoards;
  List<Highlight> highlights;
  List<FeaturedCourse> featuredCourses;
  List<FeaturedTest> featuredTests;
  List<SuccessStory> successStories;
  String bottomText;

  Message({
    required this.statusKey,
    required this.exams,
    required this.examBoards,
    required this.highlights,
    required this.featuredCourses,
    required this.featuredTests,
    required this.successStories,
    required this.bottomText,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    statusKey: json["status_key"],
    exams: List<String>.from(json["exams"].map((x) => x)),
    examBoards: List<String>.from(json["exam_boards"].map((x) => x)),
    highlights: List<Highlight>.from(json["highlights"].map((x) => Highlight.fromJson(x))),
    featuredCourses: List<FeaturedCourse>.from(json["featured_courses"].map((x) => FeaturedCourse.fromJson(x))),
    featuredTests: List<FeaturedTest>.from(json["featured_tests"].map((x) => FeaturedTest.fromJson(x))),
    successStories: List<SuccessStory>.from(json["success_stories"].map((x) => SuccessStory.fromJson(x))),
    bottomText: json["bottom_text"],
  );

  Map<String, dynamic> toJson() => {
    "status_key": statusKey,
    "exams": List<dynamic>.from(exams.map((x) => x)),
    "exam_boards": List<dynamic>.from(examBoards.map((x) => x)),
    "highlights": List<dynamic>.from(highlights.map((x) => x.toJson())),
    "featured_courses": List<dynamic>.from(featuredCourses.map((x) => x.toJson())),
    "featured_tests": List<dynamic>.from(featuredTests.map((x) => x.toJson())),
    "success_stories": List<dynamic>.from(successStories.map((x) => x.toJson())),
    "bottom_text": bottomText,
  };
}

class FeaturedCourse {
  String courseId;
  String courseName;
  String courseImage;
  dynamic courseFee;

  FeaturedCourse({required this.courseId, required this.courseName, required this.courseImage, required this.courseFee});

  factory FeaturedCourse.fromJson(Map<String, dynamic> json) => FeaturedCourse(
    courseId: json["course_id"],
    courseName: json["course_name"],
    courseImage: json["course_image"],
    courseFee: json["course_fee"],
  );

  Map<String, dynamic> toJson() => {"course_id": courseId, "course_name": courseName, "course_image": courseImage, "course_fee": courseFee};
}

class FeaturedTest {
  String testId;
  String testName;
  String testImage;
  int noOfTestPapers;
  int price;

  FeaturedTest({required this.testId, required this.testName, required this.testImage, required this.noOfTestPapers, required this.price});

  factory FeaturedTest.fromJson(Map<String, dynamic> json) => FeaturedTest(
    testId: json["test_id"],
    testName: json["test_name"],
    testImage: json["test_image"],
    noOfTestPapers: json["no_of_test_papers"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "test_id": testId,
    "test_name": testName,
    "test_image": testImage,
    "no_of_test_papers": noOfTestPapers,
    "price": price,
  };
}

class Highlight {
  String statusId;
  String statusName;
  String statusImage;
  List<InnerImage> innerImages;

  Highlight({required this.statusId, required this.statusName, required this.statusImage, required this.innerImages});

  factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
    statusId: json["status_id"],
    statusName: json["status_name"],
    statusImage: json["status_image"],
    innerImages: List<InnerImage>.from(json["inner_images"].map((x) => InnerImage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status_id": statusId,
    "status_name": statusName,
    "status_image": statusImage,
    "inner_images": List<dynamic>.from(innerImages.map((x) => x.toJson())),
  };
}

class InnerImage {
  Type type;
  String image;

  InnerImage({required this.type, required this.image});

  factory InnerImage.fromJson(Map<String, dynamic> json) => InnerImage(type: typeValues.map[json["type"]]!, image: json["image"]);

  Map<String, dynamic> toJson() => {"type": typeValues.reverse[type], "image": image};
}

enum Type { IMAGE, VIDEO }

final typeValues = EnumValues({"Image": Type.IMAGE, "Video": Type.VIDEO});

class SuccessStory {
  String studentImage;
  String studentName;
  String product;
  String testimonialMessage;

  SuccessStory({required this.studentImage, required this.studentName, required this.product, required this.testimonialMessage});

  factory SuccessStory.fromJson(Map<String, dynamic> json) => SuccessStory(
    studentImage: json["student_image"],
    studentName: json["student_name"],
    product: json["product"],
    testimonialMessage: json["testimonial_message"],
  );

  Map<String, dynamic> toJson() => {
    "student_image": studentImage,
    "student_name": studentName,
    "product": product,
    "testimonial_message": testimonialMessage,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
