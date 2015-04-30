#
#Pre-requisito: instalar git, LAMP e drush (https://github.com/drush-ops/drush)
#
# Baixando o drupal
drush dl drupal
# Movendo o diretorio sites para fora do core
mv drupal-*/sites .
ln -s $(pwd)/sites drupal-*/
# Link simbolico para diretorio
ln -s drupal-*/ ./htdocs-prod
# Baixando os modulos usuais
cd htdocs-prod
drush dl ctools google_analytics ckeditor smtp backup_migrate libraries pathauto token views xmlsitemap
# Configurando site agenda.ubatuba.cc
#cp -rf sites/default/ sites/agenda.ubatuba.cc
#mkdir sites/agenda.ubatuba.cc/files
#mkdir sites/agenda.ubatuba.cc/themes
#mkdir sites/agenda.ubatuba.cc/modules
cd ../
git clone https://github.com/ubalab/agenda-ubatuba.git
ln -s agenda-ubatuba/agenda.ubatuba.cc sites/

