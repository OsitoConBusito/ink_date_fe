/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 1
/// Strings: 41
///
/// Built on 2023-11-26 at 16:46 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String get email => 'Correo electrónico';
	String get mandatory_field => 'Campo obligatorio';
	String get not_valid_email => 'E-mail no válido';
	String get password => 'Contraseña';
	String get confirm => 'Confirmar';
	String get tattooist => 'Tatuador';
	String get admin => 'Administrador';
	String get cancel => 'Cancelar';
	String environment({required Object environment, required Object version}) => 'Ink Date ${environment} ${version}';
	late final _StringsProfileEn profile = _StringsProfileEn._(_root);
	late final _StringsSignUpEn sign_up = _StringsSignUpEn._(_root);
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
}

// Path: profile
class _StringsProfileEn {
	_StringsProfileEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get upload_profile_picture => 'Subir foto de perfil';
}

// Path: sign_up
class _StringsSignUpEn {
	_StringsSignUpEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get sign_up => 'Registrarse';
	String get sign_up_as => 'Regístrarte como:';
	String get hint_full_name => 'Aquí tu nombre completo';
	String get full_name => 'Nombre completo';
	String get verify_password => 'Verificar contraseña';
	String get have_an_account => '¿Ya tienes una cuenta?';
	String get not_matched_password => 'Las contraseñas no coinciden';
	String get not_valid_password => 'La contraseña debe tener al menos una mayúscula, un número, un símbolo y al menos 8 caracteres';
	String get code_sent => 'Te hemos enviado un código de confirmación a tu correo electrónico';
	String get type_code => 'Ingresa el código aquí';
	String get resend_code => 'Reenviar';
	String get code => 'Código';
	String get code_hint => '123456';
	String get code_not_sent => '¿No recibiste el código?';
	String get success_sign_up => '¡Hemos registrado tu correo exitosamente!';
	String get succes_resend_code => '';
	String get success_sign_up_description => 'Te invitamos a acceder a tu aplicación Ink Date a través de tu correo registrado';
	late final _StringsSignUpAdminEn admin = _StringsSignUpAdminEn._(_root);
	late final _StringsSignUpTattooistEn tattooist = _StringsSignUpTattooistEn._(_root);
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get login => 'Iniciar sesión';
	String get hint_email => 'tuemail@email.com';
	String get hint_password => '******';
	String get recover_password => 'Recuperar contraseña';
	String get error => 'Email o contraseña incorrectos';
}

// Path: sign_up.admin
class _StringsSignUpAdminEn {
	_StringsSignUpAdminEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hint_studio_email => 'tu_estudio@gmail.com';
	String get studio_email => 'Email del estudio asociado';
	String get places => 'Espacios';
	String get hint_studio_name => 'Estudio Best';
	String get studio_name => 'Nombre del estudio';
	String get sign_up_as_admin => 'Regístrate como administrador';
	String get error => 'Ocurrió un error en el registro por favor intentalo de nuevo';
	String get error_code => 'Código incorrecto';
}

// Path: sign_up.tattooist
class _StringsSignUpTattooistEn {
	_StringsSignUpTattooistEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get sign_up_as_tattooist => 'Regístrate como tatuador';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'email': return 'Correo electrónico';
			case 'mandatory_field': return 'Campo obligatorio';
			case 'not_valid_email': return 'E-mail no válido';
			case 'password': return 'Contraseña';
			case 'confirm': return 'Confirmar';
			case 'tattooist': return 'Tatuador';
			case 'admin': return 'Administrador';
			case 'cancel': return 'Cancelar';
			case 'environment': return ({required Object environment, required Object version}) => 'Ink Date ${environment} ${version}';
			case 'profile.upload_profile_picture': return 'Subir foto de perfil';
			case 'sign_up.sign_up': return 'Registrarse';
			case 'sign_up.sign_up_as': return 'Regístrarte como:';
			case 'sign_up.hint_full_name': return 'Aquí tu nombre completo';
			case 'sign_up.full_name': return 'Nombre completo';
			case 'sign_up.verify_password': return 'Verificar contraseña';
			case 'sign_up.have_an_account': return '¿Ya tienes una cuenta?';
			case 'sign_up.not_matched_password': return 'Las contraseñas no coinciden';
			case 'sign_up.not_valid_password': return 'La contraseña debe tener al menos una mayúscula, un número, un símbolo y al menos 8 caracteres';
			case 'sign_up.code_sent': return 'Te hemos enviado un código de confirmación a tu correo electrónico';
			case 'sign_up.type_code': return 'Ingresa el código aquí';
			case 'sign_up.resend_code': return 'Reenviar';
			case 'sign_up.code': return 'Código';
			case 'sign_up.code_hint': return '123456';
			case 'sign_up.code_not_sent': return '¿No recibiste el código?';
			case 'sign_up.success_sign_up': return '¡Hemos registrado tu correo exitosamente!';
			case 'sign_up.succes_resend_code': return '';
			case 'sign_up.success_sign_up_description': return 'Te invitamos a acceder a tu aplicación Ink Date a través de tu correo registrado';
			case 'sign_up.admin.hint_studio_email': return 'tu_estudio@gmail.com';
			case 'sign_up.admin.studio_email': return 'Email del estudio asociado';
			case 'sign_up.admin.places': return 'Espacios';
			case 'sign_up.admin.hint_studio_name': return 'Estudio Best';
			case 'sign_up.admin.studio_name': return 'Nombre del estudio';
			case 'sign_up.admin.sign_up_as_admin': return 'Regístrate como administrador';
			case 'sign_up.admin.error': return 'Ocurrió un error en el registro por favor intentalo de nuevo';
			case 'sign_up.admin.error_code': return 'Código incorrecto';
			case 'sign_up.tattooist.sign_up_as_tattooist': return 'Regístrate como tatuador';
			case 'login.login': return 'Iniciar sesión';
			case 'login.hint_email': return 'tuemail@email.com';
			case 'login.hint_password': return '******';
			case 'login.recover_password': return 'Recuperar contraseña';
			case 'login.error': return 'Email o contraseña incorrectos';
			default: return null;
		}
	}
}
