class LaunchesRepository {


final LaunchesWebServices  launchesWebServices;

LaunchesRepository({@required this.launchesWebServices});

Future<LaunchesModel> getAllLaunches() async{
  
final LaunchesJson = await  launchesWebServices.getLauncesData();

return  LaunchesModel.fromJson((LaunchesJson));
}
}

