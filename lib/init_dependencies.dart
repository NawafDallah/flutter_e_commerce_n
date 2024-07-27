import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'config/localization/language_cache_helper.dart';
import 'config/middle_ware/middleware_cache_helper.dart';
import 'config/theme/theme_mode_cache_helper.dart';
import 'core/cubits/locale/localization_cubit.dart';
import 'core/cubits/middleware/middleware_cubit.dart';
import 'core/cubits/network/network_connection_cubit.dart';
import 'core/cubits/theme_mode/theme_mode_cubit.dart';
import 'feature/auth/data/date_sources/user_service.dart';
import 'feature/auth/data/repository/auth_repository_impl.dart';
import 'feature/auth/domain/repository/auth_repository.dart';
import 'feature/auth/domain/use_case/user_forget_password.dart';
import 'feature/auth/domain/use_case/user_log_in.dart';
import 'feature/auth/domain/use_case/user_resend_verify_code.dart';
import 'feature/auth/domain/use_case/user_reset_password.dart';
import 'feature/auth/domain/use_case/user_sign_up.dart';
import 'feature/auth/domain/use_case/user_verify_code.dart';
import 'feature/auth/presentation/bloc/auth_bloc/auth_bloc_bloc.dart';
import 'feature/browse/data/data_sources/browse_services.dart';
import 'feature/browse/data/repository/browse_repository.dart';
import 'feature/browse/domain/repository/browse_repository.dart';
import 'feature/browse/domain/use_case/get_home_data.dart';
import 'feature/browse/domain/use_case/get_products.dart';
import 'feature/browse/presentation/bloc/browse/home_bloc/browse_bloc.dart';
import 'feature/browse/presentation/bloc/browse/product_category_bloc/product_category_bloc.dart';
import 'feature/favorite/data/data_sources/app_database.dart';
import 'feature/favorite/data/repository/favorite_product_repo.dart';
import 'feature/favorite/domain/repository/favorite_product_repo.dart';
import 'feature/favorite/domain/use_case/add_product_to_favorite.dart';
import 'feature/favorite/domain/use_case/delete_favorite_product.dart';
import 'feature/favorite/domain/use_case/delete_favorite_products.dart';
import 'feature/favorite/domain/use_case/get_saved_product.dart';
import 'feature/favorite/presentation/bloc/local_product_bloc/favorite_product_bloc.dart';
import 'feature/on_boarding/data/data_sources/static/on_boarding_service.dart';
import 'feature/on_boarding/data/repository/on_boarding_repository_imp.dart';
import 'feature/on_boarding/domain/repository/on_boarding_repository.dart';
import 'feature/on_boarding/domain/use_case/get_on_boarding_list.dart';
import 'feature/on_boarding/presentation/bloc/on_boarding_list/onboarding_cubit.dart';

part 'init_dependencies.main.dart';
