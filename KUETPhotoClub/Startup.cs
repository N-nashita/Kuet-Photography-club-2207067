using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(KUETPhotoClub.Startup))]
namespace KUETPhotoClub
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
