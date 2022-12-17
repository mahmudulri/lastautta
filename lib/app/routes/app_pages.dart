import 'package:aust_textile_alumni/app/modules/upload_video/views/upload_video.dart';
import 'package:get/get.dart';

import '../modules/alumni_book/bindings/alumni_book_binding.dart';
import '../modules/alumni_book/views/alumni_book_view.dart';
import '../modules/base/bindings/base_binding.dart';
import '../modules/base/views/base_view.dart';
import '../modules/details_screen/bindings/details_screen_binding.dart';
import '../modules/details_screen/views/upcoming_details_view.dart';
import '../modules/event/bindings/event_binding.dart';
import '../modules/event/views/event_view.dart';
import '../modules/forget_pass/bindings/forget_pass_binding.dart';
import '../modules/forget_pass/views/forget_pass_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/job/bindings/job_binding.dart';
import '../modules/job/views/job_view.dart';
import '../modules/log_in/bindings/log_in_binding.dart';
import '../modules/log_in/views/log_in_view.dart';
import '../modules/message/bindings/message_binding.dart';
import '../modules/message/views/message_view.dart';
import '../modules/notification_view/bindings/notification_view_binding.dart';
import '../modules/notification_view/views/notification_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';
import '../modules/user_post/bindings/user_post_binding.dart';
import '../modules/user_post/views/user_post_view.dart';
import '../modules/user_profile/bindings/user_profile_binding.dart';
import '../modules/user_profile/views/user_profile_view.dart';
import '../modules/video_stream/bindings/video_stream_binding.dart';
import '../modules/video_stream/views/video_stream_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.USER_POST,
      page: () => UserPostView(),
      binding: UserPostBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.ALUMNI_BOOK,
      page: () => AlumniBookView(),
      binding: AlumniBookBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () => BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.DETAILS_SCREEN,
      page: () => UpcomingDetailsView(),
      binding: DetailsScreenBinding(),
    ),
    GetPage(
      name: _Paths.MESSAGE,
      page: () => MessageView(),
      binding: MessageBinding(),
    ),
    GetPage(
      name: _Paths.JOB,
      page: () => JobView(),
      binding: JobBinding(),
    ),
    GetPage(
      name: _Paths.EVENT,
      page: () => EventView(),
      binding: EventBinding(),
    ),
    GetPage(
      name: _Paths.VIDEO_STREAM,
      page: () => VideoStreamView(),
      binding: VideoStreamBinding(),
    ),
    GetPage(
      name: _Paths.FORGET_PASS,
      page: () => ForgetPassView(),
      binding: ForgetPassBinding(),
    ),
    GetPage(
      name: _Paths.USER_PROFILE,
      page: () => UserProfileView(),
      binding: UserProfileBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_VIEW,
      page: () => NotificationView(),
      binding: NotificationViewBinding(),
    ),
    GetPage(
      name: _Paths.UPLOAD_VIDEO,
      page: () => UploadVideo(),
    ),
  ];
}
