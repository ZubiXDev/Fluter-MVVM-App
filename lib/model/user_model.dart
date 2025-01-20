class UserModel {
	String? token;

	UserModel({this.token});

	factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
				token: json['token'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'token': token,
			};
}
