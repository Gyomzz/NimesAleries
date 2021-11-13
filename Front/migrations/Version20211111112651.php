<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20211111112651 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE orders_product (id INT AUTO_INCREMENT NOT NULL, id_order_id INT NOT NULL, INDEX IDX_223F76D6DD4481AD (id_order_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE orders_product_product (orders_product_id INT NOT NULL, product_id INT NOT NULL, INDEX IDX_A6E5B64620467FDD (orders_product_id), INDEX IDX_A6E5B6464584665A (product_id), PRIMARY KEY(orders_product_id, product_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE orders_product ADD CONSTRAINT FK_223F76D6DD4481AD FOREIGN KEY (id_order_id) REFERENCES orders (id)');
        $this->addSql('ALTER TABLE orders_product_product ADD CONSTRAINT FK_A6E5B64620467FDD FOREIGN KEY (orders_product_id) REFERENCES orders_product (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE orders_product_product ADD CONSTRAINT FK_A6E5B6464584665A FOREIGN KEY (product_id) REFERENCES product (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE orders_product_product DROP FOREIGN KEY FK_A6E5B64620467FDD');
        $this->addSql('DROP TABLE orders_product');
        $this->addSql('DROP TABLE orders_product_product');
    }
}
