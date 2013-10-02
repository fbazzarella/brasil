# Brasil, mostra tua cara!

"O povo brasileiro mostrou que está disposto a mudar nosso país. Faça parte do nosso manifesto."

Um site onde as pessoas podem logar com seu Facebook e mostrar a cara para que outras pessoas sejam encorajadas a lutar por seus direitos em uma república ironicamente classificada como `democrática`.

Resolvemos disponibilizar o código do site para que sirva de incentivo ao crescimento da comunidade OpenSource.

## Instalação

O projeto roda em Ruby 2, Rails 3.2 e PostgreSQL 9.1.

Clone o repositório:

    $ git clone https://github.com/fbazzarella/brasil.git

Instale as dependências:

    $ cd brasil
    brasil$ bundle install

## Configuração

 * Copie o arquivo `config/database.yml.example` para `config/database.yml` e preencha-o de acordo com suas configurações. Após, basta criar o banco e rodar as migrations:

        brasil$ rake db:create db:migrate

 * Copie o arquivo `config/environment_variables.rb.example` para `config/environment_variables.rb` e preencha-o com as variáveis de ambiente necessesárias para se conectar aos serviços externos.

    Veja como o arquivo deverá parecer:
    
        # Set your custom environment variables here. Such as API Keys:
        
        ENV['FACEBOOK_APP_KEY']    = '123'
        ENV['FACEBOOK_APP_SECRET'] = '123qwe'
        
        ENV['ADDTHIS_ACCOUNT']     = 'ra-123qwe'
        
        ENV['ANALYTICS_ACCOUNT']   = 'UA-123-qwe'
        ENV['ANALYTICS_DOMAIN']    = 'brasil123.com.br'

    Nota: Você deverá criar um aplicativo, no caso do Facebook.


## Execução

Agora basta iniciar o servidor para que o site esteja rodando:

    brasil$ rails server

## Agradecimento

[Leonardo Ávila](http://facebook.com/leuavila) por contribuir ativamente em todo o processo de brainstorming e desenvolvimento do projeto.
